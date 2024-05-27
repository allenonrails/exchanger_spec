require_relative '../utils/dry_types'

module Exchanger 
  module Api
    class Client < Dry::Struct
      include Exchanger::Api::Rest 

      attribute :token, Types::Coercible::String
    end
  end
end