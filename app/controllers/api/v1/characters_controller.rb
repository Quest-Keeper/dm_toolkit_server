class Api::V1::CharactersController < ApplicationController
  def create
    race = params[:race]
    gender = params[:gender]
    age = params[:age]

    openai = OpenAI::Client.new(api_key: ENV["OPENAI_KEY"])

    name_response = openai.completions.create(
      engine: "text-davinci-003",
      prompt: "Generate a unique #{race} #{gender} name for a dungeons and dragons character",
      max_tokens: 3
    )

    description_response = openai.completions.create(
      engine: "text-davinci-003",
      prompt: "Describe a #{age} #{race} #{gender} dungeons and dragons character",
      max_tokens: 60
    )

    name = name_response.choices.first.text.strip
    description = description_response.choices.first.text.strip

    render json: { race: race, gender: gender, age: age, name: name, description: description }
  end
end