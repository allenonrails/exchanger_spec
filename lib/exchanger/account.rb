module Exchanger 
  class Account
    include Exchanger::Utils::Uid

    attr_reader :uid, :balance

    def initialize(user)
      @uid = get_hash user.name, user.surname
      @balance = 0
    end
  end
end
