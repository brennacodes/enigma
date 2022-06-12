require_relative 'spec_helper'

RSpec.describe 'Cryptable' do
    let!(:enigma) {Enigma.new("hello world", "12345", "040895")}
    let!(:enigma_2) {Enigma.new("hello! world!")}
    let!(:date) {"061022"}

    it 'exists' do
        expect(enigma).to be_instance_of Enigma
    end

    it 'exists without arguments' do
        expect(enigma_2).to be_instance_of Enigma
    end

    xit 'can get offsets from date' do
        expect(enigma.offsets).to eq([8, 8, 8, 4])
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
        expect(enigma.get_key(0)).to eq(12)

    end

    it 'can get offset from index value' do
        expect(enigma.get_offset(0)).to eq(8)

    end

    it 'can get shift from key and offsets' do
        expect(enigma.get_shift(0)).to eq(20)
    end

    it 'can generate a shift hash from shift' do
        expect(enigma.letter_indices).to eq(
           [{" "=>"t",
           "a"=>"u",
           "b"=>"v",
           "c"=>"w",
           "d"=>"x",
           "e"=>"y",
           "f"=>"z",
           "g"=>" ",
           "h"=>"a",
           "i"=>"b",
           "j"=>"c",
           "k"=>"d",
           "l"=>"e",
           "m"=>"f",
           "n"=>"g",
           "o"=>"h",
           "p"=>"i",
           "q"=>"j",
           "r"=>"k",
           "s"=>"l",
           "t"=>"m",
           "u"=>"n",
           "v"=>"o",
           "w"=>"p",
           "x"=>"q",
           "y"=>"r",
           "z"=>"s"},
          {" "=>"d",
           "a"=>"e",
           "b"=>"f",
           "c"=>"g",
           "d"=>"h",
           "e"=>"i",
           "f"=>"j",
           "g"=>"k",
           "h"=>"l",
           "i"=>"m",
           "j"=>"n",
           "k"=>"o",
           "l"=>"p",
           "m"=>"q",
           "n"=>"r",
           "o"=>"s",
           "p"=>"t",
           "q"=>"u",
           "r"=>"v",
           "s"=>"w",
           "t"=>"x",
           "u"=>"y",
           "v"=>"z",
           "w"=>" ",
           "x"=>"a",
           "y"=>"b",
           "z"=>"c"},
          {" "=>"o",
           "a"=>"p",
           "b"=>"q",
           "c"=>"r",
           "d"=>"s",
           "e"=>"t",
           "f"=>"u",
           "g"=>"v",
           "h"=>"w",
           "i"=>"x",
           "j"=>"y",
           "k"=>"z",
           "l"=>" ",
           "m"=>"a",
           "n"=>"b",
           "o"=>"c",
           "p"=>"d",
           "q"=>"e",
           "r"=>"f",
           "s"=>"g",
           "t"=>"h",
           "u"=>"i",
           "v"=>"j",
           "w"=>"k",
           "x"=>"l",
           "y"=>"m",
           "z"=>"n"},
          {" "=>"v",
           "a"=>"w",
           "b"=>"x",
           "c"=>"y",
           "d"=>"z",
           "e"=>" ",
           "f"=>"a",
           "g"=>"b",
           "h"=>"c",
           "i"=>"d",
           "j"=>"e",
           "k"=>"f",
           "l"=>"g",
           "m"=>"h",
           "n"=>"i",
           "o"=>"j",
           "p"=>"k",
           "q"=>"l",
           "r"=>"m",
           "s"=>"n",
           "t"=>"o",
           "u"=>"p",
           "v"=>"q",
           "w"=>"r",
           "x"=>"s",
           "y"=>"t",
           "z"=>"u"}]
        )
    end

end