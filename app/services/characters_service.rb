class CharactersService
  def initialize
    @connection = Faraday.new(url: "https://api.openai.com/v1/chat/completions") do |faraday|
      faraday.headers['Authorization'] = "Bearer #{ENV['OPENAI_KEY']}"
      faraday.headers['Content-Type'] = 'application/json'
      faraday.adapter Faraday.default_adapter
    end    
  end

  def generate_character_name(info)
    payload = {
      model: "gpt-3.5-turbo",
      messages: [
        {
          'role' => 'system',
          'content' => 'You are an AI with an extensive knowledge of the fantasy universe of Dungeons & Dragons. You are skilled at creating fitting and memorable character names.'
        },
        {
          'role' => 'user',
          'content' => "Please generate a unique and fitting #{info[:race]} #{info[:gender]} name. Only the full name and no other information is required."
        }
      ],
      temperature: 0.7,
      max_tokens: 30
    }

    response = connection.post do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = payload.to_json
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  private

  attr_reader :connection
end
