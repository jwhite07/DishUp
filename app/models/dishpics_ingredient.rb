class DishpicsIngredient < ActiveRecord::Base
  belongs_to :dishpic
  belongs_to :ingredient
end