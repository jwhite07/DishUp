class Api::V1::DishpicsController < ApplicationController
  respond_to :json
  def index
    if params[:dish_id]
      respond_with Dish.find(params[:dish_id]).dishpics
    else     
      respond_with Dishpic.all
    end
  end
end
