require 'rails_helper'

describe "Weather API" do
  it "sends weather for a location" do
    get '/api/v1/forecast?location=denver,co'

    response_body = JSON.parse(response.body, symbolize_names: true)
    weather = response_body[:data]

    expect(response).to be_successful

    expect(weather).to have_key(:id)
    expect(weaather[:id]).to eq('null')

    expect(weather).to have_key(:type)
    expect(weather[:type]).to eq('forecast')

    expect(weather).to have_key(:attributes)


  end
end
