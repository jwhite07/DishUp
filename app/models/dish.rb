class Dish < ActiveRecord::Base
  belongs_to :menu
  has_many :ingredients
  has_and_belongs_to_many :dish_types
  has_and_belongs_to_many :ingredients
  
  validates :name, :menu_id, :rating, presence: true
  validates :rating, numericality: {
    greater_than_or_equal_to: 0, 
    less_than_or_equal_to: 5
  }
  
end
