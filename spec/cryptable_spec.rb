require_relative 'spec_helper'

RSpec.describe 'Cryptable' do
    let!(:object) {Enigma.new}

    it 'exists' do
        expect(object).to be_instance_of Enigma
    end
    
  
end