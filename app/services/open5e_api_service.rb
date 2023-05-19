class Open5eApiService 
  def get_monsters(type)
    get_url("/monsters/?type=#{type}")
  end
  
  private
  def conn
    Faraday.new(url: 'https://api.open5e.com')
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end