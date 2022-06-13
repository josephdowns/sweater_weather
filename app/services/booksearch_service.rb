class BooksearchService
  def conn
    Faraday.new(url: "http://openlibrary.org")
  end

  def get_data(location)
    response = conn.get("search.json?q=#{location}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
