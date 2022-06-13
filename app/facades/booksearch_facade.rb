class BooksearchFacade
  class << self
    def service
      BooksearchService.new
    end

    def results_by_location(location, quantity)
      results = service.get_data(location)
      total_results = results[:numFound]

      books = results[:docs].first(quantity).map do |result|
        Book.new(result)
      end
      [books, total_results]
    end
  end
end
