require_relative 'helper'

enigma = Enigma.new

# input_from_file = ARGV[0]
enigma.output_to_file = ARGV[1]
@key = ARGV[2]
@date = ARGV[3]

File.open(ARGV[0], 'r') do |file|
    enigma.message = file.read
end

enigma.encrypt(enigma.message)
trace = TracePoint.trace(:call) do |tp| p [tp.lineno, tp.defined_class, tp.method_id, tp.event]
end
enigma.encrypt_output