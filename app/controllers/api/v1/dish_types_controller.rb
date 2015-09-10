class Api::V1::DishTypesController < ApplicationController
  respond_to :json
  def index
    s_dish_types = []
   
    SpecialEvent.only_active.each do |s|
      s_dish_types << s.dish_types.all
      
    end
    dish_types = DishType.only_with_dishes
    d = dish_types.all
    s = s_dish_types
    dts = s.flatten + d.flatten
    respond_with dts
    
  end
  
end
