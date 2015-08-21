class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :premium_level
  
  def distance
    if object.respond_to? :distance
      return object.distance
    else
      return ""
    end
  end
 
end
