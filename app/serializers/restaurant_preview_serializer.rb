class RestaurantSerializer < ActiveModel::Serializer
  #cache key: "restaurant", expires_in: 1.hours
  attributes :id, :name,  :city, :state, :logo, :premium_level, :distance
 
end
