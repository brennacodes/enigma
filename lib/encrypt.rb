require 'helper'


input_from_file = ARGV[0]
@message = ''
ouput_to_file = ARGV[1]
return key = ARGV[2] if !ARGV[2].nil?
return date = ARGV[3] if !ARGV[3].nil?

File.open(input_from_file, 'r') do |file|
    @message = input_from_file.read
end

enigma = Enigma.new(message, output_to_file, key = :itself, date = :itself)
enigma.encrypt
enigma.encrypt_output