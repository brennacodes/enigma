require_relative 'helper'

enigma = Enigma.new

input_from_file = ARGV[0]
enigma.output_to_file = ARGV[1]


File.open(input_from_file, 'r') do |file|
    contents = file.read
    enigma.message = contents[:encryption]
    @key = ARGV[2] || enigma.key = contents[:key]
    @date = ARGV[3] || enigma.date = contents[:date]
end

# File.open(input_from_file, 'r') do |file|
#     enigma.message = file.read
# end

enigma.decrypt(enigma.message)

trace = TracePoint.trace(:call) do |tp| p [tp.lineno, tp.defined_class, tp.method_id, tp.event]
end
enigma.decrypt_output
