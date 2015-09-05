class LocationSerializer < ActiveModel::Serializer
  cache key: "location", expires_in: 1.hours
  attributes :id, :name, :address, :city, :state, :postal_code, :logo, :phone_number, :website, :distance, :restaurant
  
  def distance
    if object.respond_to? :distance
      return object.distance
    else
      return ""
    end
  end
 
end
