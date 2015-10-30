ActiveAdmin.register Promo do
  permit_params :name, :priority, :start_date, :end_date, :img, :message, :color, :longitude, :latitude, :radius, :restaurant_id, :special_event_id, :url, :address, :city, :state
  

end
