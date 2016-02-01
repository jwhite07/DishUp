class Api::V1::LocationsController < ApplicationController
  respond_to :json
  def index
    locations = []
    
  
    if params["latitude"] && params["longitude"] 
      if params[:special_event_id]
        locations = SpecialEvent.find(params[:special_event_id]).locations.only_with_dishes.near([params["latitude"], params["longitude"]], 999999, order: 'distance')
      else
        locations = Location.preload(:restaurant, {:restaurant => :default_menu}).only_with_dishes.near([params["latitude"], params["longitude"]], distance, order: 'distance')
      end
      
    elsif coordinates = Geocoder.coordinates(params["address"])
      if params[:special_event_id]
        locations = SpecialEvent.find(params[:special_event_id]).locations.only_with_dishes.near(coordinates, 999999, order: 'distance')
      else
        locations = Location.preload(:restaurant, {:restaurant => :default_menu}).only_with_dishes.near(coordinates, distance, order: 'distance')
      end
    else
      if params[:special_event_id]
        se = SpecialEvent.find(params[:special_event_id])
        
        
        locations = SpecialEvent.find(params[:special_event_id]).locations.only_with_dishes
        
        
      else
        locations = Location.preload(:restaurant, {:restaurant => :default_menu}).only_with_dishes
      end
    end
    
    respond_with locations, serializer_params: serializer_params
  end
  private
    def serializer_params
      {special_event_id: params[:special_event_id], latitude: params["latitude"], longitude: params["longitude"]}
    end
    def distance
      if params["distance"]
        params["distance"]
      else
        50
      end
    end
end
