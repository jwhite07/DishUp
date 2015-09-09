ActiveAdmin.register SpecialEvent do
  permit_params :name, :start_date, :end_date, :launch_screen, location_ids: []
  form do |f|
    f.inputs "Add/Edit Special Event" do
      f.input :name
      f.input :start_date
      f.input :end_date
      f.input :launch_screen
      f.input :locations, :as => :check_boxes  
      
    end
    
    
    f.actions
  end
end