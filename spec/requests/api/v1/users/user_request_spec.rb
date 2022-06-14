require 'rails_helper'

RSpec.describe "user request" do
  it "creates a user" do
    headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
    }

    body = {
    'email': 'example@example.com',
    'password': 'password',
    'password_confirmation': 'password'
    }

    post '/api/v1/users', headers: headers, params: JSON.generate(body)

    created_user = User.last
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

  it "throws an error if blank" do
    headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
    }

    body = {
    'email': 'example@example.com',
    'password': '',
    'password_confirmation': ''
    }

    post '/api/v1/users', headers: headers, params: JSON.generate(body)
    users = User.all
    message = JSON.parse(response.body, symbolize_names: true)

    expect(users.empty?).to be(true)
    expect(response.status).to eq(400)
    expect(message[:error]).to eq("Cannot have blank fields")
  end

  it "throws an error if passwords no not match" do
    headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
    }

    body = {
    'email': 'example@example.com',
    'password': 'heyallllll',
    'password_confirmation': 'heyall!'
    }

    post '/api/v1/users', headers: headers, params: JSON.generate(body)
    users = User.all
    message = JSON.parse(response.body, symbolize_names: true)

    expect(users.empty?).to be(true)
    expect(response.status).to eq(400)
    expect(message[:error]).to eq("Passwords must match")
  end
end
