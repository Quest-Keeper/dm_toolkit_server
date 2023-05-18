# spec/controllers/api/v1/characters_controller_spec.rb
require 'rails_helper'

RSpec.describe Api::V1::CharactersController, type: :controller do
  describe '#create' do
    let(:character_params) { { race: 'Elf', gender: 'Male', age: 'Young' } }

    before do
      stub_request(:post, "https://api.openai.com/v1/chat/completions")
        .to_return(status: 200, body: {
          'id' => 'chatcmpl-6p9XYPYSTTRi0xEviKjjilqrWU2Ve',
          'object' => 'chat.completion',
          'created' => 1_667_674_000,
          'model' => 'gpt-3.5-turbo',
          'usage' => { 'prompt_tokens' => 56, 'completion_tokens' => 31, 'total_tokens' => 87 },
          'choices' => [
            { 'message' => { 'role' => 'assistant', 'content' => 'Generated Name or Description' } }
          ]
        }.to_json)
    end

    it 'creates a new character' do
      post :create, params: character_params

      expect(response).to have_http_status(:success)
      binding.pry
      expect(Character.count).to eq(1)
      expect(Character.last.name).to eq('Generated Name or Description')
      expect(Character.last.description).to eq('Generated Name or Description')
    end
  end
end
