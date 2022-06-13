require 'rails_helper'

describe "Weather API" do
  it "sends weather for a location" do
    get '/api/v1/forecast?location=denver,co'

    response_body = JSON.parse(response.body, symbolize_names: true)
    weather = response_body[:data]

    expect(response).to be_successful

    expect(weather).to have_key(:id)
    expect(weather[:id]).to eq(nil)

    expect(weather).to have_key(:type)
    expect(weather[:type]).to eq('forecast')

    expect(weather).to have_key(:attributes)
    expect(weather[:attributes]).to have_key(:current_weather)
    expect(weather[:attributes]).to have_key(:daily_weather)
    expect(weather[:attributes]).to have_key(:hourly_weather)

    expect(weather[:attributes][:current_weather]).to have_key(:datetime)
    expect(weather[:attributes][:current_weather]).to have_key(:sunrise)
    expect(weather[:attributes][:current_weather]).to have_key(:sunset)
    expect(weather[:attributes][:current_weather]).to have_key(:temperature)
    expect(weather[:attributes][:current_weather]).to have_key(:feels_like)

    expect(weather[:attributes][:current_weather]).to_not have_key(:dew_point)
    expect(weather[:attributes][:current_weather]).to_not have_key(:clouds)
    expect(weather[:attributes][:current_weather]).to_not have_key(:pressure)

  end
end
