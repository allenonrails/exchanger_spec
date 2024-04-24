RSpec.describe Exchanger::Api::Client do
  let(:test_client) {described_class.new(ENV.fetch('API_TOKEN') { 'fakeApi123' })}
  let(:currency_code) { 'AFN' }

  specify "#currency" do
    WebMock.disable_net_connect!  
    body = JSON.dump(
      "AFN": {
          "symbol": "Af",
          "name": "Afghan Afghani",
          "symbol_native": "؋",
          "decimal_digits": 0,
          "rounding": 0,
          "code": "AFN",
          "name_plural": "Afghan Afghanis"
      },
    )

    stub_request(:get, "https://api.freecurrencyapi.com/v1/latest/currencies/AFN").
     with( headers: { 'X-API-KEY'=>'testToken123' }).
     to_return(status: 200, body: body, headers: {})

    currency = test_client.currency currency_code

    expect(currency['AFN']["code"]).to eq(currency_code)
    expect(WebMock).to have_requested(
      :get, "https://api.freecurrencyapi.com/v1/latest/currencies/AFN"
    )
  end

  specify "#currencies" do
    currencies = VCR.use_cassette('currencies/currencies') do 
      test_client.currencies
    end

    expect(currencies["data"].keys.first).to eq('AUD')
  end

  specify "#post" do
    # TODO
  end
end
