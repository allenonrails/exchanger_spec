module Exchanger 
  class Account
    include Exchanger::Utils::Uid
    include Exchanger::Api::Converter

    attr_reader :uid, :balance

    def initialize(user)
      @uid = get_hash user.name, user.surname
      @balance = 0
    end

    def transfer(receiver, amount)
      withdraw amount
      receiver.deposit amount
    end

    def transfer_with_conversation(receiver, amount, in_currency, out_currency)
      converted_amount = convert sum: amount, from: in_currency, to: out_currency

      withdraw amount
      receiver.deposit converted_amount
    end

    def withdraw(amount)
      raise(Exchanger::IncorrectSum, 'Amount must be positive!') unless amount.positive? 
      raise(Exchanger::NotEnoughMoney, "Available: #{@balance} but tried to withdrow #{amount}") if amount > @balance

      @balance -= amount
    end

    def deposit(amount)
      raise(Exchanger::IncorrectSum, 'Amount must be positive!') unless amount.positive? 

      @balance += amount
    end
  end
end

