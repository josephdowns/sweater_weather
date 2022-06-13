require "rails_helper"

RSpec.describe "the background image request" do
  it "finds a url for an image" do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful
    image = JSON.parse(response.body, symbolize_name: true)
    binding.pry
  end
end
