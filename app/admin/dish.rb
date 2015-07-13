ActiveAdmin.register Dish do
  belongs_to :restaurant
  permit_params :name, :price, :description
  
end
