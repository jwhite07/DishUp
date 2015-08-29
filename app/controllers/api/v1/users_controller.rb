class Api::V1::UsersController < ApplicationController
  respond_to :json

  def show
    respond_with User.find(params[:id])
  end
  def create
    
    user = User.new(user_params)
    if !user_params[:password]
      pw = user.generate_password!
      user.password = pw
      user.password_confirmation = pw
    end
    if user.save
      render json: user, status: 201, location: [:api, user]
    else
      render json: { errors: user.errors }, status: 422
    end
  end
  def update
    user = current_user
    
    if user.update(user_params)
      #logger.debug "====User Params: #{user_params}"
      render json: user, status: 200, location: [:api, user]
    else
      render json: { errors: user.errors }, status: 422
    end
  end
  def destroy
    current_user.destroy
    head 204
  end

  private

    def user_params
      
      params.require(:user).permit(:email, :password, :password_confirmation, :auth_token, :ex_source, :ex_user_id )
      #logger.debug "Params:" 
    end
end