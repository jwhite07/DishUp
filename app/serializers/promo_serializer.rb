class PromoSerializer < ActiveModel::Serializer
  #cache key: "special_event", expires_in: 24.hours
  attributes :id, :name, :action, :img, :message, :title_color, :body_color, :restaurant_id, :menu_id, :special_event_id, :dish_type_id, :url, :distance
  
  def menu_id
    if object.restaurant
      object.restaurant.default_menu.id
    else
      nil
      
    end
  end
 
end
