class BooksearchSerializer
  def self.new(books, forecast, destination)
    {
      "data": {
        "id": "null",
        "type": "books",
        "attributes": {
          "destination": "#{destination}",
          "forecast": {
            "summary": forecast.current_weather.conditions,
            "temperature": "#{forecast.current_weather.temperature} F"
          },
          "total_books_found": books[1],
          "books": books[0]
        }
      }
    }
  end
end
