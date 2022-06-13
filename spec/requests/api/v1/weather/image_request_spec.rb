require "rails_helper"

RSpec.describe "the background image request" do
  it "finds a url for an image" do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful
    image = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(image).to have_key(:id)
    expect(image).to have_key(:type)
    expect(image[:type]).to eq('image')
    expect(image).to have_key(:attributes)
    expect(image[:attributes]).to have_key(:image_url)
    expect(image[:attributes]).to have_key(:description)
    expect(image[:attributes]).to have_key(:credit)
  end
end
