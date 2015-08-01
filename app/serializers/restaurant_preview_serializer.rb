class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name,  :city, :state, :logo, :premium_level
 
end
