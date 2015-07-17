class Api::V1::DishpicQualityRatingsController < ApplicationController
  respond_to :json
  def create
    dishpic_quality_rating = DishpicQualityRating.new(rating_params)
    dishpic_quality_rating.user_id = current_user.id
    dishpic_quality_rating.dishpic_id = params[:dishpic_id]
    dishpic = dishpic_quality_rating.dishpic
    if dishpic_quality_rating.save
      render json: dishpic, status: 201, location: [:api, dishpic]
    else
      render json: { errors: dishpic.errors }, status: 422
    end
  end
  def update 
    dishpic_quality_rating = DishpicQualityRating.where(:user_id => current_user.id, :dishpic_id => rating_params[:dishpic_id]).first
     
    dishpic_quality_rating.rating = rating_params[:rating]
    dishpic = dishpic_quality_rating.dishpic
    if dishpic_quality_rating.save
      render json: dishpic, status: 200, location: [:api, dishpic]
    else
      render json: { errors: dishpic.errors }, status: 422
    end
  end
  private

    def rating_params
      
      params.require(:dishpic_quality_rating).permit(:rating, :dishpic_id)
      #logger.debug "Params:" 
    end
end
