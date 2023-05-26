require 'rails_helper'

RSpec.describe Api::V1::LootController, type: :controller do
  describe 'GET #generate' do
    context 'with valid parameters' do
      it 'returns a random assortment of loot' do
        VCR.use_cassette('loot_generation') do
          get :index, params: { type: 'magic', rarity: 'uncommon', amount: '10' }

          json_response = JSON.parse(response.body)
         
          expect(response).to have_http_status(:success)
          expect(json_response).to have_key('data')
          expect(json_response['data']).to be_an(Array)
          expect(json_response['data'].length).to eq(10)
          expect(json_response['data'].first).to have_key('name')
        end
      end
    end

    context 'with invalid parameters' do
      it 'returns an error message' do
        VCR.use_cassette('loot_generation_invalid') do
          get :index, params: { type: 'invalid', rarity: 'invalid', amount: '-1' }
        
          expect(response).to have_http_status(:bad_request)
        end
      end
    end
  end
end
