require_relative 'helper'

enigma = Enigma.new
File.open(ARGV[0], 'r') { |f| enigma.message = f.read }
enigma.output_to_file = ARGV[1]
enigma.key = ARGV[2] if ARGV[2] != nil
enigma.date = ARGV[3] if ARGV[3] != nil

enigma.encrypt(enigma.message)
File.open(ARGV[1], "w") {|file| file.write(enigma.message)}
File.open('key.txt', "w") {|file| file.write(enigma.key)}
File.open('date.txt', "w") {|file| file.write(enigma.date)}

puts "Created #{enigma.output_to_file} with the key #{enigma.key} and date #{enigma.date}"