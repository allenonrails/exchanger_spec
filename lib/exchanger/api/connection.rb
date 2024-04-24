module Exchanger 
  module Api 
    module Connection
      BASE_URL = 'https://api.freecurrencyapi.com/v1/latest'
  
      def connection(client)
        Faraday.new(options(client)) do |faraday|
          faraday.adapter Faraday.default_adapter
        end
      end

      private

      def options(client)
        {
          headers: {
            accept: 'apllication/json'
          },
          url: BASE_URL + "?apikey=#{client.token}"
        }
      end
    end
  end
end
