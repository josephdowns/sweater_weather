require 'rails_helper'

RSpec.describe "book search request" do
  it "returns books about the destination" do
    get "/api/v1/book-search?location=denver,co&quantity=5"

    expect(response).to be_successful
    results = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(results).to be_a(Hash)
    results.each do |result|
      expect(result).to have_key(:id)
      expect(result).to have_key(:books)
      expect(result).to have_key(:attributes)
      expect(result[:attributes]).to have_key(:destination)
      expect(result[:attributes]).to have_key(:forecast)
      expect(result[:attributes][:forecast]).to have_key(:summary)
      expect(result[:attributes][:forecast]).to have_key(:temperature)
      expect(results[:attributes][:books]).to be_a(Array)
    end

  end
end
