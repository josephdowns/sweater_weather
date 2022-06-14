require 'rails_helper'

RSpec.describe "user request" do
  before(:each) do
    @headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    @body = {
      'email': 'example@example.com',
      'password': 'password',
      'password_confirmation': 'password'
    }

    post '/api/v1/users', headers: @headers, params: JSON.generate(@body)
  end

  it "creates a user" do
    created_user = User.last
    binding.pry
    user = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(user).to have_key(:attributes)
    expect(user[:attributes]).to have_key(:email)
    expect(user[:attributes]).to have_key(:api_key)
    expect(user).to have_key(:type)
    expect(user[:type]).to eq("users")
    expect(created_user.email).to eq('example@example.com')
  end
end
