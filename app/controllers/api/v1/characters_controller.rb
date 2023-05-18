class Api::V1::CharactersController < ApplicationController
  def create
    service = CharactersService.new

    character_info = {
      race: params[:race],
      gender: params[:gender]
    }

    response = service.generate_character_name(character_info)

    render json: { name: response[:choices][0][:message][:content] }
  end
end