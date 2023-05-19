class Api::V1::MonstersController < ApplicationController
  def index
    service = Open5eApiService.new
    monsters = service.get_monsters(params[:type])
    
    challenge_rating = params[:challenge_rating].to_i
    filtered_monsters = monsters[:results].select { |monster| monster[:challenge_rating].to_i == challenge_rating }
    monsters[:results] = filtered_monsters

    render json: monsters
  end
end
