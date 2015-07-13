class Ingredient < ActiveRecord::Base
  has_many :user_ingredient_preferences
  has_many :users, :through => :user_ingredient_preferences
  has_many :dishes_ingredients
  has_many :dishes, :through => :dishes_ingredients
  has_many :dishpics_ingredients
  has_many :dishpics, :through => :dishpics_ingredients
  validates :name, presence: true
  
end
