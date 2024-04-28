RSpec.describe Exchanger::Api::Client do
  let(:test_client) {described_class.new(ENV.fetch('API_TOKEN') { 'api123' })}
  let(:currency_code) { 'AFN' }

  specify "#currency" do 
    body = JSON.dump(
      "AFN": {
          "symbol": "Af",
          "name": "Afghan Afghani",
          "symbol_native": "؋",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "AFN",
          "name_plural": "Afghan Afghanis"
      }
    )

    stub_request(:get, "https://api.freecurrencyapi.com/v1/latest/currencies/AFN").
      with(headers: { 'X-API-KEY'=>'testToken123' }).
      to_return(status: 200, body: body, headers: {})

    currency = test_client.currency currency_code
    
    expect(currency['AFN']["code"]).to eq(currency_code)  
    expect(WebMock).to have_requested(
      :get, "https://api.freecurrencyapi.com/v1/latest/currencies/AFN"
    )
  end

  specify "#currencies" do 
    body = JSON.dump({
      "data": {
        "AED": {
            "symbol": "AED",
            "name": "United Arab Emirates Dirham",
            "symbol_native": "د.إ",
            "decimal_digits": 2,
            "rounding": 0,
            "code": "AED",
            "name_plural": "UAE dirhams"
        },
        "AFN": {
            "symbol": "Af",
            "name": "Afghan Afghani",
            "symbol_native": "؋",
            "decimal_digits": 0,
            "rounding": 0,
            "code": "AFN",
            "name_plural": "Afghan Afghanis"
        } 
      }
    })

    stub_request(:get, "https://api.freecurrencyapi.com/v1/latest/currencies").
      with( query: {limit: 2}).
      to_return(status: 200, body: body)

    currencies = test_client.currencies limit: 2
    expect(currencies["data"].keys.length).to eq(2)
    expect(currencies["data"].keys.first).to eq('AED')

    expect(
      a_request(:get, "https://api.freecurrencyapi.com/v1/latest/currencies").
       with( query: {limit: 2} )
    ).to have_been_made
  end

  specify "#create_currency" do 
    data_currency = { data: { symbol: "USD", name: "Доллар США", 
               symbol_native: "$", name_plural: "dollars" } }

    stub_request(:post, "https://api.freecurrencyapi.com/v1/latest/currencies").
      with( body: JSON.dump(data_currency) ).to_return(status: 200, body: {id: 95}.to_json, headers: {})
    
    create_currency = test_client.create_currency data_currency
    expect(create_currency['id']).to eq(95)
  end
end
