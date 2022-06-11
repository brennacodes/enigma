require './lib/helper'
# require 'Cryptable'

# $ ruby ./lib/encrypt.rb message.txt encrypted.txt
# Created 'encrypted.txt' with the key 82648 and date 240818
# $ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818
# Created 'decrypted.txt' with the key 82648 and date 240818

RSpec.describe Enigma do
  let!(:enigma) {Enigma.new("hello world", "02715", '040895')}
  let!(:command)
  let!(:enigma_2) {Enigma.new("hello! world?", "02715", "040895")}

  it "is an instance of" do
    expect(enigma).to be_instance_of Enigma
  end