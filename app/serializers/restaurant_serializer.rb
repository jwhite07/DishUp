class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :state, :postal_code, :logo, :premium_level, :phone_number, :website, :distance
  
  def distance
    if object.respond_to? :distance
      return object.distance
    else
      return ""
    end
  end
 
end
