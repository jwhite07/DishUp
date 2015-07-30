class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :state, :postal_code, :logo, :premium_level, :phone_number, :website
 
end
