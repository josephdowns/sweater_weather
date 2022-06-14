class MapquestService
  include Parseable

  def conn
    Faraday.new(url: "http://www.mapquestapi.com/geocoding/v1/") do |f|
      f.params['key'] = ENV['mapquest_api_key']
    end
  end

  def address_to_geocode(address)
    response = parse_json(conn.get("address?location=#{address}"))
  end
end
