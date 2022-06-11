require_relative 'helper'

enigma = Enigma.new

input_from_file = ARGV[0]
enigma.output_to_file = ARGV[1]
return @key = ARGV[2] if !ARGV[2].nil?
return @date = ARGV[3] if !ARGV[3].nil?

File.open(input_from_file, 'r') do |file|
    enigma.message = file.read
end

enigma.encrypt(enigma.message)
enigma.encrypt_output