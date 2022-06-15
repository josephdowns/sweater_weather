class MapquestService
  include Parseable

  def conn
    Faraday.new(url: "http://www.mapquestapi.com/") do |f|
      f.params['key'] = ENV['mapquest_api_key']
    end
  end

  def address_to_geocode(address)
    response = parse_json(conn.get("geocoding/v1/address?location=#{address}"))
  end

  def roadtrip(origin, destination)
    response = parse_json(conn.get("directions/v2/route?from=#{origin}&to=#{destination}"))
  end
end
