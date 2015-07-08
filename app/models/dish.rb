class Dish < ActiveRecord::Base
  belongs_to :menu
  has_many :ingredients
  has_and_belongs_to_many :dish_types
  has_and_belongs_to_many :ingredients
end
