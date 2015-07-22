class Dish < ActiveRecord::Base
  belongs_to :restaurant
  
  has_many :dishes_dish_types
  has_many :dish_types, :through => :dishes_dish_types
  
  has_many :dishes_menus
  has_many :menus, :through => :dishes_menus
  
  has_many :dishes_ingredients
  has_many :ingredients, :through => :dishes_ingredients
  
  has_many :dishpics
  
  has_many :dish_ratings
  
  validates :name,  :rating, presence: true
  validates :rating, numericality: {
    greater_than_or_equal_to: 0, 
    less_than_or_equal_to: 5
  }
  
end
