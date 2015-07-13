class Dish < ActiveRecord::Base
  has_many :dish_types_menus
  has_many :dish_types, :through => :dish_types_menus
  has_many :dishes_ingredients
  has_many :dishes_menus
  has_many :menus, :through => :dishes_menus
  has_many :ingredients, :through => :dishes_ingredients
  
  validates :name,  :rating, presence: true
  validates :rating, numericality: {
    greater_than_or_equal_to: 0, 
    less_than_or_equal_to: 5
  }
  
end
