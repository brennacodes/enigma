require_relative 'spec_helper'

RSpec.describe 'Cryptable' do
    let!(:object) {Enigma.new}

    it 'exists' do
        expect(object).to be_instance_of Enigma
    end

    it 'can return todays date' do
        expect(object.date).to eq Date.today.strftime("%d%m%y")
    end
    

  
end