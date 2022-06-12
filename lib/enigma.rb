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
    end

    def encrypt_output
        encryption = {encryption: @message, key: @key, date: @date}
        File.open(@output_to_file, "w") do |file|
            file.write(encryption)
            file.close
        end
        output_message
    end

    def decrypt(message, date = GET_DATE)
        @date = date
        crypt_message(@message, 'decrypt')
    end

    def decrypt_output
        decryption = {decryption: @message, key: @key, date: @date}
        File.open(@output_to_file, "w") do |file|
            file.write(decryption)
        end
        output_message
        trace = TracePoint.trace(:call) do |tp| p [tp.lineno, tp.defined_class, tp.method_id, tp.event]
        end
    end

end