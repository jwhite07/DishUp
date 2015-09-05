class Api::V1::RestaurantsController < ApplicationController
  respond_to :json
  def index
    restaurants = []
    if params[:special_event_id]
      restaurants = SpecialEvent.find(params[:special_event_id]).restaurants.only_with_dishes
    else
      restaurants = Restaurant.only_with_dishes
    end
    logger.debug "restaurants: #{restaurants.count}"
    if params["latitude"] && params["longitude"] 
      respond_with restaurants.near([params["latitude"], params["longitude"]], 999999, order: 'distance'), serializer_params: serializer_params
    else
      respond_with restaurants, serializer_params: serializer_params
    end
  end
  private
    def serializer_params
      {special_event_id: params[:special_event_id], latitude: params["latitude"], longitude: params["longitude"]}
    end
end
