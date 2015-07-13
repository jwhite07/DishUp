class DishType < ActiveRecord::Base
  has_many :dishes_dish_types
  has_many :dishes, :through => :dishes_dish_types
  validates :name, presence: true
  
end
