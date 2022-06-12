require_relative 'spec_helper'

RSpec.describe 'Cryptable' do
    let!(:enigma) {Enigma.new("hello world", "12345", "040895")}
    let!(:enigma_2) {Enigma.new("hello! world!")}
    let!(:key) {enigma.key = "02715"}
    let!(:date) {enigma.date = "040895"}

    it 'exists' do
        expect(enigma).to be_instance_of Enigma
    end

    it 'exists without arguments' do
        expect(enigma_2).to be_instance_of Enigma
    end

    it 'can get offsets from date' do
        expect(enigma.offsets).to eq([1, 0, 2, 5])
    end

    it 'can return a key string of 5 numbers between 0 and 9' do
        random_value = (Kernel.rand * 1).round
        key = (Array.new(5) {random_value}).join('')
        allow(enigma).to receive(:generate_key).and_return(key)
    end

    it 'can generate a shifter array from key' do
        key = (Kernel.rand * 10).round
        array = Array.new(4) {key}
        allow(enigma).to receive(:shifter).and_return(array)
    end

    it 'can get shift value from key and offsets' do
        expect(enigma.get_shift(0)).to eq([3])
    end

    it 'can generate a shift hash from shift' do
        expect(enigma.get_shift_hashes).to eq(
             [{" "=>"c",
             "a"=>"d",
             "b"=>"e",
             "c"=>"f",
             "d"=>"g",
             "e"=>"h",
             "f"=>"i",
             "g"=>"j",
             "h"=>"k",
             "i"=>"l",
             "j"=>"m",
             "k"=>"n",
             "l"=>"o",
             "m"=>"p",
             "n"=>"q",
             "o"=>"r",
             "p"=>"s",
             "q"=>"t",
             "r"=>"u",
             "s"=>"v",
             "t"=>"w",
             "u"=>"x",
             "v"=>"y",
             "w"=>"z",
             "x"=>" ",
             "y"=>"a",
             "z"=>"b"},
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
            {" "=>"s",
             "a"=>"t",
             "b"=>"u",
             "c"=>"v",
             "d"=>"w",
             "e"=>"x",
             "f"=>"y",
             "g"=>"z",
             "h"=>" ",
             "i"=>"a",
             "j"=>"b",
             "k"=>"c",
             "l"=>"d",
             "m"=>"e",
             "n"=>"f",
             "o"=>"g",
             "p"=>"h",
             "q"=>"i",
             "r"=>"j",
             "s"=>"k",
             "t"=>"l",
             "u"=>"m",
             "v"=>"n",
             "w"=>"o",
             "x"=>"p",
             "y"=>"q",
             "z"=>"r"},
            {" "=>"t",
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
             "z"=>"s"
        }])
    end
end