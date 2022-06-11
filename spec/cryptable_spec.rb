require_relative 'spec_helper'

RSpec.describe 'Cryptable' do
    let!(:enigma) {Enigma.new}

    it 'exists' do
        expect(enigma).to be_instance_of Enigma
    end

    it 'can return todays date' do
        expect(Cryptable::DATE).to eq Date.today.strftime("%m%d%y")
    end

 
  
end