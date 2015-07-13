ActiveAdmin.register Restaurant do
  permit_params :name, :address, :city, :state, :country, :postal_code, :logo, :premium_level
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
    h1 "Menus"
    restaurant.menus.each do |menu|
      panel menu.name do
        h2 "Dishes"
        table_for menu.dishes do
          #column "Image", {|dishpic| }
          column "Name", :name
          column "Description", :description
          column "rating", :rating
          column "price", :price
        end
      end
    end
  end
  sidebar "Details", only: :show do
    attributes_table_for restaurant do
      row :address
      row :city
      row :state
      row :postal_code
      row :premium_level
    end
  end

end
