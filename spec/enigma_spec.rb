require './lib/helper'
require './lib/cryptable'

RSpec.describe 'Enigma' do
  let!(:enigma) {Enigma.new("hello world")}
  let!(:enigma_2) {Enigma.new("hello! world?")}
  let!(:input_file) {'encrypted.txt'}
  let!(:output_file) {'decrypted.txt'}

  it "is an instance of" do
    expect(enigma).to be_instance_of Enigma
  end
  
  it 'can return todays date' do
    expect(Enigma::GET_DATE).to eq Date.today.strftime("%m%d%y")
    enigma.date = "040895"
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
    enigma.key = "02715"
    enigma.date = "040895"
    expect(enigma.encrypt(enigma.message)).to eq({
      :encryption => "keder ohulw",
      :key => "02715",
      :date => "040895"
      })
    enigma_2.key = "02715"
    enigma_2.date = "040895"
    expect(enigma_2.encrypt(enigma_2.message)).to eq({
      :encryption => "keder!sprrdx?",
      :key => "02715",
      :date => "040895"
    })
  end
      
  it "can decrypt a message" do
    enigma.key = "02715"
    enigma.date = "040895"
    expect(enigma.decrypt("keder ohulw")).to eq({
      :decryption => "hello world",
      :key => "02715",
      :date => "040895"
      })
    enigma_2.key = "02715"
    enigma_2.date = "040895"
    expect(enigma_2.decrypt("keder!sprrdx?")).to eq({
      :decryption => "hello! world?",
      :key => "02715",
      :date => "040895"
    })
  end

  it "can encrypt a message when date not given" do
    enigma.key = "02715"
    expect(enigma.encrypt("hello world")).to eq({
      :encryption => "mgjdtbugwnb",
      :key => "02715",
      :date => "061222"
      })
  end
    
  it "can decrypt a message when date is not given" do    
    enigma_2.key = "02715"
    expect(enigma_2.decrypt("mgjdtbugwnb")).to eq({
      :decryption => "hello world",
      :key => "02715",
      :date => "061222"
    })
  end
end
  # xit "can crack an encrypted message" do
  #   evaluate = Enigma.new("hello world end", "08304", "291018").encrypt
  #   to_crack = evaluate[:encryption]
  #   expect(Enigma.new(to_crack).crack(message)).to eq({
  #     :decryption => "hello world end",
  #     :key => "02715",
  #     :date => "060622"
  #   })
  # end