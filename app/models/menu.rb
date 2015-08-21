class Menu < ActiveRecord::Base
  belongs_to :restaurant
  
  has_many :menu_menu_sections
  has_many :menu_sections, :through => :menu_menu_sections
  has_many :dish_menu_sections, :through => :menu_sections
  has_many :dishes, :through => :dish_menu_sections
  
  
  #validates_associated :dishes
  has_many :dishpics, :through => :dishes
  
  validates :name, :restaurant_id, presence: true
end
