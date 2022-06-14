require 'rails_helper'

RSpec.describe 'sessions request' do
  before(:each) do
    @user = User.create(email: "ganon@zelda.com", password: "1234",
    api_key: "1345676a")

    @headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
  end

  it "allows a user to login" do
    body = {
      'email': @user.email,
      'password': @user.password
    }

    post "/api/v1/sessions", headers: @headers, params: JSON.generate(body)

    login = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(login).to have_key(:attributes)
    expect(login).to have_key(:id)
    expect(login).to have_key(:type)
    expect(login[:type]).to eq("users")
    expect(login[:attributes]).to have_key(:email)
    expect(login[:attributes][:email]).to eq(@user.email)
    expect(login[:attributes]).to have_key(:api_key)
    expect(login[:attributes][:api_key]).to eq(@user.api_key)
  end

  it "errors if wrong password is given" do
    body = {
      'email': @user.email,
      'password': "maybeitsmayeline"
    }

    post "/api/v1/sessions", headers: @headers, params: JSON.generate(body)
    message = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(400)
    expect(message[:error]).to eq("Incorrect credentials")

  end

  it "errors if wrong email is given" do
    body = {
      'email': "chuck@pm.com",
      'password': @user.password
    }

    post "/api/v1/sessions", headers: @headers, params: JSON.generate(body)
    message = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(400)
    expect(message[:error]).to eq("Incorrect credentials")

  end
end
