class Api::V1::DishesController < ApplicationController
 # params :latitude, :longitude
  respond_to :json
  def index
    if params[:dish_type_id]
      respond_with DishType.find(params[:dish_type_id]).dishes, each_serializer: DishPreviewSerializer, serializer_params: serializer_params
    elsif params[:restaurant_id]
      
      respond_with Restaurant.find(params[:restaurant_id]).dishes, each_serializer: DishPreviewSerializer, serializer_params: serializer_params
    elsif params[:menu_id]
      respond_with Menu.find(params[:menu_id]).dishes, each_serializer: DishPreviewSerializer, serializer_params: serializer_params
    else
      render json: Dish.all, each_serializer: DishPreviewSerializer, serializer_params: serializer_params
    end
  end
  def show
    respond_with Dish.find(params[:id]), serializer_params: serializer_params
  end
  private
  def serializer_params
    {current_user: current_user, latitude: params["latitude"], longitude: params["longitude"]}
  end
end
