class MapquestService
  def conn
    Faraday.new(url: "http://www.mapquestapi.com/geocoding/v1/") do |f|
      f.params['key'] = ENV['mapquest_api_key']
    end
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def address_to_geocode(address)
    response = conn.get("address?location=#{address}")
    binding.pry
    parse_json(response)
  end
end
