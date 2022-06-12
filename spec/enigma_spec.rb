require './lib/helper'
require './lib/cryptable'

RSpec.describe 'Enigma' do
  let!(:enigma) {Enigma.new("hello world", "02715", '040895')}
  let!(:enigma_2) {Enigma.new("hello! world?", "02715", "040895")}
  let!(:input_file) {'encrypted.txt'}
  let!(:output_file) {'decrypted.txt'}

  it "is an instance of" do
    expect(enigma).to be_instance_of Enigma
  end

  it 'can return todays date' do
    expect(Enigma::GET_DATE).to eq Date.today.strftime("%m%d%y")
    expect(enigma.date).to eq("040895")
  end

  it 'can return an alphabet array' do
    expect(Enigma::ALPHABET).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

  it 'can tell if it is not a letter or space' do
    expect(Enigma::ALPHABET.include?("a")).to be_truthy
    expect(Enigma::ALPHABET.include?("!")).to be_falsey
  end

  it "can encrypt a message" do
    expect(enigma.encrypt(enigma.message)).to eq({
      :encryption => "eetsl dvoll",
      :key => "02715",
      :date => "040895"
    })
    expect(enigma_2.encrypt(enigma.message)).to eq({
      :encryption => "keder! ohulw?",
      :key => "02715",
      :date => "061122"
    })
  end
      
  xit "can decrypt a message" do
    enigma.encrypt(message, "02715", '040895')
    expect(enigma.decrypt(ciphertext, "02715", '040895')).to eq({
      :decryption => "hello world",
      :key => "02715",
      :date => "040895"
      })
    expect(enigma_2.decrypt).to eq({
      :encryption => "hello! world?",
      :key => "02715",
      :date => "061122"
      })
  end

  xit "can encrypt a message when date not given" do
    expect(enigma.encrypt("hello world", "02715")).to eq({
      :encryption => "pmjdwhugztb",
      :key => "02715",
      :date => "061122"
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
