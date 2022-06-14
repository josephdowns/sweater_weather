class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.password_digest.nil? || user.email.nil?
      render json: {error: "Cannot have blank fields"}, status: 400
    elsif params[:password] != params[:password_confirmation]
      render json: {error: "Passwords must match"}, status: 400
    elsif user.save
      render json: UserSerializer.register(user), status: :created
    else
      render json: {error: "Cannot save user"}, status: 404
    end
  end

  private
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end
