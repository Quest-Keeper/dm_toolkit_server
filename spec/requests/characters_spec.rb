require 'rails_helper'

RSpec.describe Api::V1::CharactersController, type: :controller do
  describe "POST #create" do
    let(:race) { 'Elf' }
    let(:gender) { 'Male' }
    let(:age) { '100' }
    let(:name_response) { instance_double('Faraday::Response') }
    let(:description_response) { instance_double('Faraday::Response') }
    let(:name) { "Elrond" }
    let(:description) { "A wise old elf with long silver hair and piercing blue eyes." }

    before do
      allow(OpenAI::Client).to receive(:new).and_return(double)

      allow(name_response).to receive_message_chain(:choices, :first, :text, :strip).and_return(name)
      allow(description_response).to receive_message_chain(:choices, :first, :text, :strip).and_return(description)

      allow(OpenAI::Client.new(api_key: ENV["OPENAI_KEY"])).to receive(:completions).and_return(name_response, description_response)
    end

    it 'returns a successful response' do
      post :create, params: { race: race, gender: gender, age: age }
      expect(response).to be_successful
    end

    it 'returns correct data' do
      post :create, params: { race: race, gender: gender, age: age }
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['name']).to eq(name)
      expect(parsed_response['description']).to eq(description)
      expect(parsed_response['race']).to eq(race)
      expect(parsed_response['gender']).to eq(gender)
      expect(parsed_response['age']).to eq(age)
    end
  end
end