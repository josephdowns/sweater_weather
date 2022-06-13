require 'rails_helper'

RSpec.describe BooksearchService do
  it 'gets data from API' do
    location = "denver,co"
    response = BooksearchService.get_data(location)

    expect(response).to be_a(Hash)
  end
end
