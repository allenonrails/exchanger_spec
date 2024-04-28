module Exchanger 
  module Api
    class Client
      include Exchanger::Api::Rest 

      attr_reader :token

      def initialize(token)
        @token = token
      end
    end
  end
end