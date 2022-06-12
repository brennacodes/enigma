require_relative 'helper'

File.open(ARGV[0], 'r') do |file|
    enigma = Enigma.new
    enigma.output_to_file = ARGV[1]
    @key = ARGV[2]
    @date = ARGV[3]
    enigma.message = file.read
    enigma.encrypt(enigma.message)
    enigma.encrypt_output
    file.close
end
