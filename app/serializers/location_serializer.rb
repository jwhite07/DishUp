class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :state, :postal_code, :logo, :phone_number, :website, :distance, :restaurant
  
  def distance
    if object.respond_to? :distance
      return object.distance
    else
      return ""
    end
  end
 
end
