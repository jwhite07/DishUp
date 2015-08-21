ActiveAdmin.register Restaurant do
  permit_params :name,  :premium_level, :hours, 
    locations_attributes: [:id, :name, :address, :city, :state, :country, :postal_code, :website, :phone_number],
    menus_attributes: [:id, :name, :default, menu_section_ids: [] ],
    menu_sections_attributes: [:id, :name, :display_name, :description, dish_ids: []]
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
  show do
    h2 "Menus"
    restaurant.menus.each do |menu|
      panel menu.name do
        menu.menu_sections.each do |ms|
          panel ms.name do
            table_for ms.dishes do
              column "Image" do |d|
                image_tag d.lead_dishpic_url
              end
            
              column "Name", :name
              column "Description", :description
              column "rating", :rating
              column "price", :price
            end
          end
        end
      end
    end
    h2 "Locations"
    table_for restaurant.locations do
      column :name
      column :address
      column :city
      column :state
      column :country
      column :postal_code
      column :website
      column :phone_number
    end
    
  end
  
  
  form do |f|
    f.inputs "Add/Edit Restaurant" do
      f.input :name
      f.input :premium_level
      f.input :hours
    
    end
  
    f.inputs do
      f.has_many :locations, new_record: 'New Location' do |loc|
        loc.input :name
        loc.input :address
        loc.input :city
        loc.input :state
        loc.input :country
        loc.input :postal_code
        loc.input :website
        loc.input :phone_number
      end
    end
    f.inputs do 
      f.has_many :menus, new_record: 'New Menu' do |m|
        m.input :name
        m.input :default
        m.input :sections, :as => :check_boxes, :collection => restaurant.menu_sections, :member_label => :name
      end
    end
    f.inputs do 
      f.has_many :menu_sections, new_record: 'New Menu Section' do |ms|
        ms.input :name
        ms.input :description
        ms.input :display_name
        ms.input :dishes, :as => :check_boxes, :collection => restaurant.dishes
      end
    end
    
        
    
    f.actions
  end
  

end
