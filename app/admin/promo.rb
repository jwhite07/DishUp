ActiveAdmin.register Promo do
  permit_params :name, :action, :priority, :start_date, :end_date, :img, :message, :title_color, :body_color, :longitude, :latitude, :radius, :restaurant_id, :special_event_id, :url, :address, :city, :state
  
  form do |f|
    f.inputs "Add/Edit Promo" do
      f.input :name
      f.input :action, as: :select, collection: Promo.actions.keys
      f.input :priority, as: :select, collection: [*1..10]
      f.input :start_date, as: :date_select
      f.input :end_date, as: :date_select
      f.input :img
      f.input :message
      f.input :title_color, as: :color
      f.input :body_color, as: :color
      f.input :restaurant, as: :select, :collection => Restaurant.all
      f.input :dish_type, as: :select, :collection => DishType.all
      f.input :special_event, as: :select, :collection => SpecialEvent.all
      
      
      f.input :address
      f.input :city
      f.input :state
      f.input :radius
      f.input :latitude
      f.input :longitude
      
      
      
      
    
    end
    f.actions
  end
    

end
