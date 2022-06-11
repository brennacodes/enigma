require_relative 'spec_helper'

RSpec.describe 'Cryptable' do
    let!(:enigma) {Enigma.new("hello world", "12345", "040895")}

    it 'exists' do
        expect(enigma).to be_instance_of Enigma
    end

    it 'can return todays date' do
        expect(Cryptable::DATE).to eq Date.today.strftime("%m%d%y")
    end

    it 'can return an alphabet array' do
        expect(Cryptable::ALPHABET).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
    end

    it 'can get offsets from date' do
        expect(enigma.offsets).to eq([4, 4, 8, 4])
    end

    it 'can return a key srting of 5 numbers between 0 and 9' do
        random_value = (Kernel.rand * 1).round
        key = (Array.new(5) {random_value}).join('')
        allow(enigma).to receive(:generate_key).and_return(key)
    end

    it 'can generate a shifter array from key' do
        key = (Kernel.rand * 10).round
        array = Array.new(4) {key}
        allow(enigma).to receive(:shifter).and_return(array)
    end

    it 'can get key from index value' do

    end

    it 'can get offset from index value' do

    end

    it 'can get shift from key and offsets' do

    end

    it 'can generate a shift hash from shift' do
        expect(enigma.letter_indices).to eq(['a', 'b', 'c'])
    end

end