class DishType < ActiveRecord::Base
  default_scope {where("dishes_count > ? ", 0)}
  has_many :dishes_dish_types
  has_many :dishes, :through => :dishes_dish_types
  validates :name, presence: true
  
end
