class Ingredient < ActiveRecord::Base
  has_many :user_ingredient_preferences
  
  has_and_belongs_to_many :dishes
  has_and_belongs_to_many :dishpics
  
end
