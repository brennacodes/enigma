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
        expect(enigma.letter_indices).to eq([{
            " "=>"p",
            "a"=>"q",
            "b"=>"r",
            "c"=>"s",
            "d"=>"t",
            "e"=>"u",
            "f"=>"v",
            "g"=>"w",
            "h"=>"x",
            "i"=>"y",
            "j"=>"z",
            "k"=>" ",
            "l"=>"a",
            "m"=>"b",
            "n"=>"c",
            "o"=>"d",
            "p"=>"e",
            "q"=>"f",
            "r"=>"g",
            "s"=>"h",
            "t"=>"i",
            "u"=>"j",
            "v"=>"k",
            "w"=>"l",
            "x"=>"m",
            "y"=>"n",
            "z"=>"o"},
            {" "=>" ",
            "a"=>"a",
            "b"=>"b",
            "c"=>"c",
            "d"=>"d",
            "e"=>"e",
            "f"=>"f",
            "g"=>"g",
            "h"=>"h",
            "i"=>"i",
            "j"=>"j",
           "k"=>"k",
           "l"=>"l",
           "m"=>"m",
           "n"=>"n",
           "o"=>"o",
           "p"=>"p",
           "q"=>"q",
           "r"=>"r",
           "s"=>"s",
           "t"=>"t",
           "u"=>"u",
           "v"=>"v",
           "w"=>"w",
           "x"=>"x",
           "y"=>"y",
           "z"=>"z"},
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
           "z"=>"u"
        }])
    end

end