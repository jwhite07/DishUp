class LocationSerializer < ActiveModel::Serializer
  cache key: "location", expires_in: 1.hours, except: [:distance, :menu_id]
  attributes :id, :name, :address, :city, :state, :postal_code, :logo, :phone_number, :website, :distance, :restaurant, :menu_id
   
  
  
  def menu_id
    special_event_id = @options[:serializer_params][:special_event_id]
    if special_event_id
      
      SpecialEvent.find(special_event_id).menus.where(restaurant_id: object.restaurant.id).first.id
    else
      object.restaurant.default_menu.id
    end
  end
  def distance
    if object.respond_to? :distance
      return object.distance
    else
      return ""
    end
  end
 
end
