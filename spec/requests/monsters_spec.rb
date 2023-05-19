require 'rails_helper'

RSpec.describe Api::V1::MonstersController, type: :controller do
  describe 'GET #index' do
    let(:monsters) {
      {
        "count": 2,
        "next": nil,
        "previous": nil,
        "results": [
          {
            "name": "Dragon",
            "type": "Dragon",
            "challenge_rating": 10,
            "slug": "dragon",
            "document__slug": "bestiary",
            "document__title": "Bestiary",
            "document__license_url": "http://open5e.com/legal"
          },
          {
            "name": "Baby Dragon",
            "type": "Dragon",
            "challenge_rating": 5,
            "slug": "baby-dragon",
            "document__slug": "bestiary",
            "document__title": "Bestiary",
            "document__license_url": "http://open5e.com/legal"
          },
          {
            "name": "Ancient Dragon",
            "type": "Dragon",
            "challenge_rating": 15,
            "slug": "ancient-dragon",
            "document__slug": "bestiary",
            "document__title": "Bestiary",
            "document__license_url": "http://open5e.com/legal"
          }
        ]
      }
    }
    let(:service) { instance_double(Open5eApiService) }

    before do
      allow(Open5eApiService).to receive(:new).and_return(service)
      allow(service).to receive(:get_monsters).and_return(monsters)
    end

    it 'returns filtered monsters by challenge rating' do
      get :index, params: { type: 'Dragon', challenge_rating: '5' }

      parsed_response = JSON.parse(response.body, symbolize_names: true)
      binding.pry
      expect(parsed_response[:results].length).to eq(1)
      expect(parsed_response[:results][0][:name]).to eq('Baby Dragon')
      expect(parsed_response[:results][0][:challenge_rating]).to eq(5)
    end
  end
end
