class Api::V1::CharactersController < ApplicationController
  def create
    service = CharactersService.new

    character_info = {
      race: params[:race],
      gender: params[:gender],
      age: params[:age]
    }

    name_response = service.generate_character_name(character_info)
    description_response = service.generate_character_description(character_info)
    
    character = Character.create(
      race: character_info[:race],
      gender: character_info[:gender],
      age: character_info[:age],
      name: name_response[:choices][0][:message][:content],
      description: description_response[:choices][0][:message][:content]
    )

    render json: CharacterSerializer.new(character).serializable_hash
  end
end