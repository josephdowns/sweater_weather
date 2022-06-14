class ForecastService
  include Parseable

  def conn
    Faraday.new(url: "https://api.openweathermap.org/data/2.5/") do |f|
      f.params['appid'] = ENV['openweather_api_key']
    end
  end

  def get_data(lat, lng)
    response = parse_json(conn.get("onecall?lat=#{lat}&lon=#{lng}&units=imperial"))
  end

end
