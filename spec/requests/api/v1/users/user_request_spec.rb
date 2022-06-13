require 'rails_helper'

RSpec.describe "user request" do
  before(:each) do
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
  end

  it "creates a user" do
    expect(response).to be_successful
  end
end
