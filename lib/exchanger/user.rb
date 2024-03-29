module Exchanger 
  class User
    attr_reader :name, :surname

    def initialize(name, surname)
      @name = name.is_a?(String) ? name : name.to_s
      @surname = surname
    end

    def full_name 
      "#{@name} #{@surname}"
    end
  end
end
