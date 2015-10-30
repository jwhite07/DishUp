class PromoSerializer < ActiveModel::Serializer
  #cache key: "special_event", expires_in: 24.hours
  attributes :id, :name, :img, :message, :color, :restaurant_id, :special_event_id, :url, :distance
  
  
 
end
