require 'rails_helper'

RSpec.describe Open5eApiService do
  describe '#get_monsters' do
    it 'returns a list of monsters' do
      VCR.use_cassette('open5e_api_service') do
        response = Open5eApiService.new.get_monsters('dragon')
  
        expect(response).to be_a(Hash)
      end
    end
  end
end