require 'rails_helper'

RSpec.describe BooksearchFacade do
  it ".results_by_location" do
    location = "chicago"
    quantity = 3
    books = BooksearchFacade.results_by_location(location, quantity)

    expect(books).to be_a(Array)
    expect(books[0].count).to eq(quantity)

    books[0].each do |book|
      expect(book).to be_a(Book)
    end
  end
end
