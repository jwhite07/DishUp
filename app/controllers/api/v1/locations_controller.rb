class Api::V1::LocationsController < ApplicationController
  respond_to :json
  def index
    if params["latitude"] && params["longitude"] 
      respond_with Location.preload(:restaurant).only_with_dishes.near([params["latitude"], params["longitude"]], 999999, order: 'distance')
    else
      respond_with Location.preload(:restaurant).only_with_dishes
    end
  end
end
