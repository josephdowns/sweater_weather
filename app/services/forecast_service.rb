class ForecastService
  def conn
    Faraday.new(url: "https://api.openweathermap.org/data/2.5/") do |f|
      f.params['appid'] = ENV['openweather_api_key']
    end
  end

  def get_data(lat, lng)
    response = conn.get("onecall?lat=#{lat}&lon=#{lng}&units=imperial")
    parse_json(response)
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
