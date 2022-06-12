require_relative 'helper'
require_relative 'cryptable'

class Enigma
    include Cryptable

    GET_DATE = Date.today.strftime('%m%d%y')
    ALPHABET = ('a'..'z').to_a << " "
    
    attr_accessor   :key,
                    :date,
                    :message,
                    :output_to_file,
                    :shift_array
    
    def initialize(message = '', key = generate_key, date = GET_DATE, output_to_file = '')
        @key = key
        @date = date
        @message = message
        @output_to_file = output_to_file
        @shift_array = []
    end

    def encrypt(message)
        crypt_message(message, 'encrypt')
        {encryption: @message, key: @key, date: @date}
    end

    def decrypt(message)
        crypt_message(message, 'decrypt')
        {decryption: @message, key: @key, date: @date}
    end
end