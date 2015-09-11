class RestaurantSerializer < ActiveModel::Serializer
  cache key: "restaurant", expires_in: 12.hours
  attributes :id, :name, :premium_level, :menu_id
   
  
  
  def menu_id
    if @special_event_id
      SpecialEvent.find(@special_event_id).menus.where(restaurant_id: object.id)
    else
      object.default_menu.id
    end
  end
 
end
