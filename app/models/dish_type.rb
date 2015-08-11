class DishType < ActiveRecord::Base
  scope :only_with_dishes, -> {where("dishes_count > ? ", 0)}
  has_many :dishes_dish_types
  has_many :dishes, :through => :dishes_dish_types
  validates :name, presence: true
  
end
