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
        crypt_message(message)
        encrypt_output
    end

    def encrypt_output
        encryption = Hash.new(encryption: @message, key: @key, date: @date)
        File.new(@output_to_file, "w").write(@message)
        puts "Created #{@output_to_file} with the key #{@key} and date #{@date}"
    end
    
end