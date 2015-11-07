class DishType < ActiveRecord::Base
  default_scope {order("sort_order ASC")}
  scope :only_with_dishes, -> {where("dishes_count > ? ", 0)}
  has_many :dishes_dish_types
  has_many :dishes, :through => :dishes_dish_types
  has_many :promos
  
  belongs_to :special_event
  validates :name, presence: true
  
end
