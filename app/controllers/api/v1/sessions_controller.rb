class Api::V1::SessionsController < ApplicationController
  
  def create
    user_password = params[:session][:password]
    user_email = params[:session][:email]
    ex_user_id = params[:session][:ex_user_id]
    ex_source = params[:session][:ex_source]
    ex_token = params[:session][:ex_token]
    if  user_email.present? 
      user = User.find_by(email: user_email)
    end
    if ex_user_id.present? && user == nil
      user = User.find_by(ex_user_id: ex_user_id)
    end
    if user == nil
      render json: { errors: "User not found", code: 2}, status: 422
    else 
      case ex_source
      when "du"
        if user.valid_password? user_password
          sign_in user, store: false
          user.generate_authentication_token!
          user.save
          render json: user, status: 200, location: [:api, user]
        else
          render json: { errors: "Invalid email or password" }, status: 422
        end
      when "t"
        #TODO: Confirm token with twitter
        sign_in user, store: false
        user.generate_authentication_token!
        user.ex_token = ex_token
        user.save
        render json: user, status: 200, location: [:api, user]
      when "fb"
        #TODO: Confirm token with facebook
        sign_in user, store: false
        user.generate_authentication_token!
        user.ex_token = ex_token
        user.save
        render json: user, status: 200, location: [:api, user]
      end
    end
  end
  def destroy
    user = User.find_by(auth_token: params[:id])
    user.generate_authentication_token!
    user.save
    head 204
  end
  
end
