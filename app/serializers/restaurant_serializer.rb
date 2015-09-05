class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :premium_level, :menu_id
   
  
  
  def menu_id
    if scope[:special_event_id]
      SpecialEvent.find(scope[:special_event_id]).menus.where(restaurant_id: object.id)
    else
      object.default_menu.id
    end
  end
 
end
