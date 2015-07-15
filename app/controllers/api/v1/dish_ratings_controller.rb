class Api::V1::DishRatingsController < ApplicationController
  respond_to :json
  def create
    dish_rating = DishRating.new(rating_params)
    dish_rating.user_id = current_user.id
    dish_rating.dish_id = params[:dish_id]
    dish = dish_rating.dish
    if dish_rating.save
      render json: dish, status: 201, location: [:api, dish]
    else
      render json: { errors: dish.errors }, status: 422
    end
  end
  def update 
    dish_rating = DishRating.where(:user_id => current_user.id, :dish_id => rating_params[:dish_id]).first
     
    dish_rating.rating = rating_params[:rating]
    dish = dish_rating.dish
    if dish_rating.save
      render json: dish, status: 200, location: [:api, dish]
    else
      render json: { errors: dish.errors }, status: 422
    end
  end
  private

    def rating_params
      
      params.require(:dish_rating).permit(:rating, :dish_id)
      #logger.debug "Params:" 
    end
end
