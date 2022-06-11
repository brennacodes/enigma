require 'helper'



File.open(ARGV[0], 'r') do |file|
   input_text = file.read
   ouput_file = ARGV[1]
   ARGV[2].exists? ? key = ARGV[2] : next
   ARGV[3].exists? ? date = ARGV[3] : next 
   enigma = Enigma.new(input_text, output_file, key = :itself, date = :itself)
   enigma.encrypt
   enigma.encrypt_output
#    enigma.public_send :encrypt, input_text, output_file, key, date
end
