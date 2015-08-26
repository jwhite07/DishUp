class Api::V1::SessionsController < ApplicationController
  
  def create
    user_password = params[:session][:password]
    user_email = params[:session][:email]
    user_token = params[:session][:token]
    provider = params[:session][:provider]
    if user = user_email.present? && User.find_by(email: user_email)
      if user.valid_password? user_password
        sign_in user, store: false
        user.generate_authentication_token!
        user.save
        render json: user, status: 200, location: [:api, user]
      else
        render json: { errors: "Invalid login", code: "3" }, status: 422
      end
    else
      render json: {errors: "User not found", code: "2"}, status: 422
  end
  def destroy
    user = User.find_by(auth_token: params[:id])
    user.generate_authentication_token!
    user.save
    head 204
  end
end
