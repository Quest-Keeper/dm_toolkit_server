class Api::V1::MonstersController < ApplicationController
  # def index
  #   service = Open5eApiService.new
  #   monsters = service.get_monsters(params[:type])

  #   challenge_rating = params[:challenge_rating].to_i
  
  #   filtered_monsters = monsters[:results].select { |monster| monster[:challenge_rating].to_i == challenge_rating }

  #   monsters[:results] = filtered_monsters
  #   render json: monsters
  # end
  def index
    data = Open5eApiService.new.get_monsters(params[:type])
    challenge_rating = params[:challenge_rating].to_f
    
    data[:results].select! do |monster|
  
      monster[:challenge_rating].to_f == challenge_rating
    end
    data[:results].map! do |monster|
      {
        name: monster[:name],
        size: monster[:size],
        type: monster[:type],
        challenge_rating: monster[:challenge_rating]
      }
    end

    render json: data
  end  
end
