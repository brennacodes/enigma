require 'helper'

class Enigma
    def encrypt(message, *arguments)
        Encrypt.new(message, *arguments)
    end

    def decrypt(message, *arguments)
        Decrypt.new(message, *arguments)
    end

    def crack(message, date = todays_date)
        Crack.new(message, date)
    end
end