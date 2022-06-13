class BackgroundsService
  include Parseable

  def conn
    Faraday.new(url: "https://api.unsplash.com/search/") do |f|
      f.params['client_id'] = ENV['unsplash_api_key']
    end
  end

  def get_data(location)
    response = parse_json(conn.get("photos?query=#{location}"))
  end
end
