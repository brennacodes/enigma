require_relative 'helper'
require_relative 'cryptable'

class Enigma
    include Cryptable

    GET_DATE = Date.today.strftime('%m%d%y')
    ALPHABET = ('a'..'z').to_a << " "
    SPECIAL_CHARS = !ALPHABET.any?
    
    attr_accessor   :key,
                    :date,
                    :message,
                    :output_to_file,
                    :shift_array
    
    def initialize
        @key = generate_key
        @date = GET_DATE
        @message = message
        @output_to_file = output_to_file
        @shift_array = []
    end

    def encrypt(message)
        crypt_message(message, 'encrypt')
        # encrypt_output
    end

    def encrypt_output
        encryption = {encryption: @message, key: @key, date: @date}
        File.open(@output_to_file, "w") do |file|
            file.write(encryption)
        end
        output_message
    end
    
end