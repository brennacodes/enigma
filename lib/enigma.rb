require 'helper'
require 'cryptable'

class Enigma
    include Cryptable

    GET_DATE = Date.today.strftime('%m%d%y')
    ALPHABET = ('a'..'z').to_a << " "
    SPECIAL_CHARS = !ALPHABET.any?
    
    attr_reader :message, :key, :date
    attr_accessor :shift_array
    
    def initialize(message, *arguments)
        @message = message
        @key = arguments[0] || generate_key
        @date = arguments[1] || GET_DATE
        @shift_array = []
    end

end