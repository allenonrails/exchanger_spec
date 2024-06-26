module Exchanger 
  class User
    extend Forwardable
    
    attr_reader :name, :surname, :account

    def_delegators :account, :balance

    def initialize(name, surname)
      @name = name.is_a?(String) ? name : name.to_s
      @surname = surname
      create_account
    end

    def full_name 
      "#{@name} #{@surname}"
    end

    private 

    def create_account 
      @account = Account.new self
    end
  end
end

