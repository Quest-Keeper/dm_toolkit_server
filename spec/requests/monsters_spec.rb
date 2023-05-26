require 'rails_helper'

RSpec.describe Api::V1::MonstersController, type: :controller do
  describe 'GET #index' do
    it 'returns filtered monsters by challenge rating' do
      VCR.use_cassette('open5e_api_service_monsters') do
        get :index, params: { type: 'Dragon', challenge_rating: '17' }

        parsed_response = JSON.parse(response.body, symbolize_names: true)
        binding.pry
        expect(parsed_response[:results].length).to eq(6)
        expect(parsed_response[:results][0][:name]).to eq('Adult Amethyst Dragon')
        expect(parsed_response[:results][0][:challenge_rating]).to eq("17")
      end
    end
  end
end
