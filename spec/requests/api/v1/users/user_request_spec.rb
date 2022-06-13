require 'rails_helper'

RSpec.describe "user request" do
  it "creates a user" do
    headers = {
      'Content-Type': 'application/json'
      'Accept': 'application/json'
    }

    body = {
      'email': 'example@example.com'
      'password': 'password'
      'password_confirmation': 'password'
    }


    post '/api/v1/users', headers: headers, params: JSON.generate(body)
  end
end
