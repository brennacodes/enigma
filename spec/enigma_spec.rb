require './lib/helper'

RSpec.describe Enigma do
  let!(:enigma) {Enigma.new}
  let!(:message) {"hello world"}
  let!(:ciphertext) {"keder ohulw"}

  it "is an instance of" do
    expect(enigma).to be_instance_of Enigma
  end

  xit "can encrypt a message" do
    expect(enigma.encrypt(message, "02715", '040895')).to eq(    {
          :encryption => "keder ohulw",
          :key => "02715",
          :date => "040895"
        })
  end

  xit "can decrypt a message" do
    enigma.encrypt(message, "02715", '040895')
    expect(enigma.decrypt(ciphertext, "02715", '040895')).to eq({
          :decryption => "hello world",
          :key => "02715",
          :date => "040895"
        })
  end

  xit "can encrypt a message when date not given" do
    expect(enigma.encrypt("hello world", "02715")).to eq({
          :encryption => "pmjdwhugztb",
          :key => "02715",
          :date => "060622"
        })
  end

  xit "can decrypt a message when date is not given" do
    evaluate = enigma.encrypt("hello world", "02715")
    ciphertext = evaluate[:encryption]
    expect(enigma.decrypt(ciphertext, "02715")).to eq({
          :decryption => "hello world",
          :key => "02715",
          :date => "060622"
        })
  end

  xit "can crack an encrypted message" do
    evaluate = Enigma.new("hello world end", "08304", "291018").encrypt
    to_crack = evaluate[:encryption]
    require "pry"; binding.pry
    expect(Enigma.new(to_crack).crack(message)).to eq({
          :decryption => "hello world end",
          :key => "02715",
          :date => "060622"
        })
  end
end



# STUB:
# allow(enigma).to receive(:).and_return()

# MOCK: verifies behavior, checks that a method does the right thing without controlling output
# "given a valid encryptor with the method encrypt that takes an argument
# encryptor = double("encryptor")
# Set up an expectation that the method will be called with arguments:
# expect(encryptor).to receive(:encrypt).with("args")

# encr = Enigma.new(encryptor
# encr.encrypt("agrgs")

# In class:
# defi(encryptor)
# def *encrypt*("args")
#   @encryptor.something("args")
# end
