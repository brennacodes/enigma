require 'helper'
require 'cryptable'

class Enigma
    include Cryptable

    attr_reader :message, :key, :date
    attr_accessor :shift_array
    
    def initialize(message, *arguments)
        @message = message
        @key = arguments[0] || generate_key
        @date = arguments[1] || DATE
        @shift_array = []
    end

end