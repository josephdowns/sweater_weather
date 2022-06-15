require 'rails_helper'

RSpec.describe "road trip requests" do
  before(:each) do
    @header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    @user = User.create(email: 'lee@keck.com', password: 'password')
  end

  it "returns a hash with info" do

    body = {
      "origin": "Denver, CO",
      "destination": "Pueblo, CO",
      "api_key": @user.api_key
    }

    post '/api/v1/road_trip', headers: @header, params: JSON.generate(body)
    info = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(info).to be_a(Hash)
    expect(info).to have_key(:id)
    expect(info[:id]).to eq(nil)
    expect(info).to have_key(:type)
    expect(info[:type]).to eq("roadtrip")
    expect(info).to have_key(:attributes)
    expect(info[:attributes]).to have_key(:start_city)
    expect(info[:attributes][:start_city]).to eq("Denver, CO")
    expect(info[:attributes]).to have_key(:end_city)
    expect(info[:attributes][:end_city]).to eq("Pueblo, CO")
    expect(info[:attributes]).to have_key(:travel_time)
    expect(info[:attributes]).to have_key(:weather_at_eta)
    expect(info[:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(info[:attributes][:weather_at_eta]).to have_key(:conditions)

  end

  it "returns 401 for Unauthorized user" do
    body = {
      'origin': "Denver, CO",
      'destination': "Pueblo, CO",
      'api_key': "12356"
    }

    post '/api/v1/road_trip', headers: @header, params: JSON.generate(body)
    message = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(401)
    expect(message[:error]).to eq("Unauthorized")
  end

  it "can do long distances" do
    body = {
      'origin': "New York, NY",
      'destination': "Los Angeles, CA",
      'api_key': @user.api_key
    }

    post '/api/v1/road_trip', headers: @header, params: JSON.generate(body)
    info = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(info).to be_a(Hash)
    expect(info).to have_key(:id)
    expect(info[:id]).to eq(nil)
    expect(info).to have_key(:type)
    expect(info[:type]).to eq("roadtrip")
    expect(info).to have_key(:attributes)
    expect(info[:attributes]).to have_key(:start_city)
    expect(info[:attributes][:start_city]).to eq("New York, NY")
    expect(info[:attributes]).to have_key(:end_city)
    expect(info[:attributes][:end_city]).to eq("Los Angeles, CA")
    expect(info[:attributes]).to have_key(:travel_time)
    expect(info[:attributes]).to have_key(:weather_at_eta)
    expect(info[:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(info[:attributes][:weather_at_eta]).to have_key(:conditions)
  end

  it "cannot do oceans" do
    body = {
      'origin': "New York, NY",
      'destination': "London, UK",
      'api_key': @user.api_key
    }

    post '/api/v1/road_trip', headers: @header, params: JSON.generate(body)
    info = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(info[:attributes][:travel_time]).to eq("impossible")
    expect(info[:attributes][:weather_at_eta][:conditions]).to eq("")
    expect(info[:attributes][:weather_at_eta][:temperature]).to eq("")
  end
end
