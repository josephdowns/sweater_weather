class BackgroundsService
  def conn
    Faraday.new(url: "https://api.unsplash.com/search/") do |f|
      f.params['client_id'] = ENV['unsplash_api_key']
    end
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_data(location)
    response = conn.get("photos?query=#{location}")
    parse_json(response)
  end
end
