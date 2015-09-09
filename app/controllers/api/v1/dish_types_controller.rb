class Api::V1::DishTypesController < ApplicationController
  respond_to :json
  def index
    dish_types = []
    SpecialEvent.only_active.each do |s|
      dish_types << s.dish_types
    end
    dish_types << DishType.only_with_dishes
    
    respond_with dish_types
    
  end
  
end
