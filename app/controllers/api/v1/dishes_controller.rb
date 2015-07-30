class Api::V1::DishesController < ApplicationController
  respond_to :json
  def index
    if params[:dish_type_id]
      respond_with DishType.find(params[:dish_type_id]).dishes, serializer_params: {current_user: current_user}
    elsif params[:restaurant_id]
      respond_with Restaurant.find(params[:restaurant_id]).dishes, serializer_params: {current_user: current_user}
    else
      respond_with Dish.all
    end
  end
  
end
