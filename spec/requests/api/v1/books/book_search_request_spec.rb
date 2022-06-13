require 'rails_helper'

RSpec.describe "book search request" do
  it "returns books about the destination" do
    get "/api/v1/book-search?location=denver,co&quantity=5"

    expect(response).to be_successful
    results = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(results).to be_a(Hash)
    expect(results).to have_key(:id)

    expect(results).to have_key(:attributes)
    expect(results[:attributes]).to have_key(:destination)
    expect(results[:attributes]).to have_key(:forecast)
    expect(results[:attributes][:forecast]).to have_key(:summary)
    expect(results[:attributes][:forecast]).to have_key(:temperature)
    expect(results[:attributes]).to have_key(:books)
    expect(results[:attributes][:books]).to be_a(Array)
    expect(results[:attributes][:books].count).to eq(5)

  end
end
