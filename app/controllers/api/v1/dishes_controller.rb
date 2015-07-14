class Api::V1::DishesController < ApplicationController
  respond_to :json
  def index
    if params[:dish_type_id]
      respond_with DishType.find(params[:dish_type_id]).dishes
    else
      
      respond_with Dish.all
    end
  end
  
end
