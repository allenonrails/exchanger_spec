module Exchanger
  module Api
    module Rest
      include Exchanger::Api::Request

      def currency(currency_id)
        get "currencies/#{currency_id}", self
      end

      def currencies(params = {})
        get "", self, params
      end

      def create_currency(params)
        post 'currencies', self, params
      end
    end
  end
end

