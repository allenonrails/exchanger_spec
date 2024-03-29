module Exchanger 
  class User
    attr_reader :name, :surname

    def initialize(name, surname)
      @name = name 
      @surname = surname
    end

    def full_name 
      "#{@name} #{@surname}"
    end
  end
end
