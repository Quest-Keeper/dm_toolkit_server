require 'rails_helper'

RSpec.describe CharactersService do
  let(:service) { CharactersService.new }

  describe '#generate_character_name' do
    it 'generates a character name' do
      info = { race: 'Dwarf', gender: 'Male' }
      response = service.generate_character_name(info)
      binding.pry

      expect(response).to be_a(Hash)
      expect(response).to have_key(:choices)
      expect(response[:choices]).to be_an(Array)
      expect(response[:choices].first).to have_key(:message)
      expect(response[:choices].first[:message]).to have_key(:content)
    end
  end
end
