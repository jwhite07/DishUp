class Api::V1::DishTypesController < ApplicationController
  respond_to :json
  def index
    respond_with DishType.all
  end
  
end
