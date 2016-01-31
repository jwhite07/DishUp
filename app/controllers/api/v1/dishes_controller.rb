class Api::V1::DishesController < ApplicationController
 # params :latitude, :longitude
  respond_to :json
  def index
    
    if params[:dish_type_id]
      dt = DishType.find(params[:dish_type_id])
      if dt.special_event
        
        dishes = dt.special_event.dishes.includes(:dishpics, :dish_ratings).uniq
        
        serializer_params[:special_event_id] = dt.special_event.id
      else
        dishes = DishType.find(params[:dish_type_id]).dishes.includes(:dishpics, :dish_ratings)
      end
      if params["latitude"] && params["longitude"]
        dishes = dishes.near([params["latitude"], params["longitude"]], distance)
      elsif coordinates = Geocoder.coordinates(params["address"])
        
        dishes = dishes.near(coordinates, distance)
      end
    elsif params[:restaurant_id]
      dishes =  Restaurant.find(params[:restaurant_id]).dishes.includes(:dishpics, :dish_ratings)
    elsif params[:menu_id]
      dishes =  Menu.find(params[:menu_id]).dishes.includes(:dishpics, :dish_ratings)
    else
      
      logger.debug "Serialzer Params: #{serializer_params}"
      dishes = Dish.includes(:dishpics, :dish_ratings).all
    end
    
    dishes = dishes.to_a
    if params[:initialDishId]
      dishes = dishes.unshift(Dish.find(params[:initialDishId]))
    end
    dishes = dishes.uniq {|d| d.id}
    #puts serializer_params
    respond_with dishes, each_serializer: DishPreviewSerializer, serializer_params: serializer_params
  end
  def show
    respond_with Dish.find(params[:id]), serializer_params: serializer_params
  end
  private
    def serializer_params
      {current_user: current_user, latitude: params["latitude"], longitude: params["longitude"], special_event_id: nil, location_id: params["location_id"], menu_id: params[:menu_id], dish_type_id: params[:dish_type_id]}
    end
    def distance
      if params["distance"]
        params["distance"]
      else
        50
      end
    end
end
