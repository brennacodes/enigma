require 'helper'
require 'cryptable'

class Enigma
    include Cryptable

    # GET_DATE = Date.today.strftime('%m%d%y')
    # ALPHABET = ('a'..'z').to_a << " "
    # SPECIAL_CHARS = !ALPHABET.any?
    
    attr_reader :message, :key, :date
    attr_accessor :shift_array
    
    def initialize(message, output_file, *arguments)
        @message = message
        @output_file = output_file
        @key = arguments[1] || generate_key
        @date = arguments[2] || DATE
        @shift_array = []
    end

    def encrypt
        crypt_message(message, @key, @date)
        encrypt_output
    end

    def encrypt_output
        encryption = Hash.new(encryption: encrypt_message, key: @key, date: @date)
        puts {}
        output_message(encryption[], @key, @date)
    
end