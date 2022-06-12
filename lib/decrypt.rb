require_relative 'helper'

enigma = Enigma.new

File.open('./text/' + ARGV[0], 'r') {|f| enigma.message = f.read }
File.open('./text/key.txt', 'r') {|f| enigma.key = f.read }
File.open('./text/date.txt', 'r') {|f| enigma.date = f.read }

enigma.key = ARGV[2] if ARGV[2] != nil
enigma.date = ARGV[3] if ARGV[3] != nil
enigma.output_to_file = ARGV[1]

enigma.decrypt(enigma.message)
File.open('./text/' + ARGV[1], "w") {|file| file.write(enigma.message)}

puts "Created #{enigma.output_to_file} with the key #{enigma.key} and date #{enigma.date}"