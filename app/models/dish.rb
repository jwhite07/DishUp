class Dish < ActiveRecord::Base
  after_save :add_to_default_menu
  belongs_to :restaurant
  
  has_many :dishes_dish_types
  has_many :dish_types, :through => :dishes_dish_types
  accepts_nested_attributes_for :dish_types
  
  has_many :dishes_menus
  has_many :menus, :through => :dishes_menus
  
  has_many :dishes_ingredients
  has_many :ingredients, :through => :dishes_ingredients
  
  has_many :dishpics
  accepts_nested_attributes_for :dishpics
  
  has_many :dish_ratings
  
  validates :name,  :rating, :restaurant_id, presence: true
  validates :rating, numericality: {
    greater_than_or_equal_to: 0, 
    less_than_or_equal_to: 5
  }
  def add_to_default_menu
    default_menu = Menu.where(restaurant_id: self.restaurant.id ).first
    DishesMenu.where(menu_id: default_menu.id, dish_id: self.id).first_or_create!
  end
  
end
