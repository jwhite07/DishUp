class Api::V1::RestaurantsController < ApplicationController
  respond_to :json
  def index
    if params["latitude"] && params["longitude"] 
      respond_with Restaurant.only_with_dishes.near([params["latitude"], params["longitude"]], 999999, order: 'distance')
    else
      respond_with Restaurant.only_with_dishes
    end
  end
end
