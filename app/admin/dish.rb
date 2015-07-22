ActiveAdmin.register Dish do
  permit_params :name, :price, :description, :restaurant, :rating
  
end
