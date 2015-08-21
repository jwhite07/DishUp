class Api::V1::DishTypesController < ApplicationController
  respond_to :json
  def index
    respond_with DishType.only_with_dishes
    
  end
  
end
