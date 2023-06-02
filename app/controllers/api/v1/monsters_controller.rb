class Api::V1::MonstersController < ApplicationController
  def index
    challenge_rating = params[:challenge_rating].to_f
    data = Open5eApiService.new.get_monsters(params[:type], challenge_rating)
    
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
