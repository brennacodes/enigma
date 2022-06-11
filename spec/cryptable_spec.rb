require_relative 'spec_helper'

RSpec.describe 'Cryptable' do
    let!(:enigma) {Enigma.new}

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

    it 'can return a random array of 4 numbers between 1 and 9' do
        sampler = double('sampler')
        allow(sampler).to receive(:sample).and_return(Array.new(4) {rand(0..9)})
      
    end
end