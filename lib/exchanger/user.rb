module Exchanger 
  class User < Dry::Struct
    extend Forwardable

    attribute :name, Types::Coercible::String
    attribute :surname, Types::Coercible::String.optional

    def_delegators :account, :balance

    def after_initialize()
      @account ||= Account.new(self)
    end

    def full_name 
      "#{@name} #{@surname}"
    end
  end
end

