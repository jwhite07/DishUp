ActiveAdmin.register Dish do
  permit_params :name, :price, :description, :restaurant_id, :rating, dish_type_ids: [], dishpics_attributes: [:url, :caption, :user_id]
  show do
    panel "Details" do
      attributes_table_for dish do
        row :id
        row :name
        row :restaurant
        row :price
        row :rating
        row :description
        row :created_at
        row :updated_at
      end
    end
    panel "DishPics" do
      table_for dish.dishpics do 
        column :url do |d|
          image_tag d.url
        end
        
        column :user
        column :caption

      end
    end
    panel "Menus" do
      table_for dish.menus do
        column :name
      end
      
      
    end
    panel "Dish Types" do
      table_for dish.dish_types do
        column "name" do |dish_type|
          dish_type.name
        end

      end
    end
    
  end
  form do |f|
    f.inputs "Add/Edit Dish" do
      f.input :name
      f.input :restaurant
      f.input :description
      f.input :price
      f.input :dish_types, :as => :check_boxes  
    end
    f.inputs do
      f.has_many :dishpics, new_record: 'Create DishPic' do |dishpic|
        
          dishpic.input :url
          dishpic.input :user
          dishpic.input :caption 
        
      end
    end
    
    f.actions
  end
end
