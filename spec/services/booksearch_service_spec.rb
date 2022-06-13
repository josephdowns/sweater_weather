require 'rails_helper'

RSpec.describe BooksearchService do
  it 'gets data from API' do
    location = "denver,co"
    service = BooksearchService.new
    response = service.get_data(location)

    expect(service).to be_an_instance_of(BooksearchService)
    expect(response).to be_a(Hash)
    expect(response).to have_key(:numFound)
    expect(response).to have_key(:docs)
    expect(response[:docs]).to be_a(Array)
  end
end
