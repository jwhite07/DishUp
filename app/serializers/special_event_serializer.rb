class SpecialEventSerializer < ActiveModel::Serializer
  #cache key: "special_event", expires_in: 24.hours
  attributes :id, :name, :start_date, :end_date, :launch_screen
  
  
 
end
