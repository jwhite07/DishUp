class MenuSection < ActiveRecord::Base
  belongs_to :restaurant
  has_many :menu_menu_sections
  has_many :menus, -> {uniq}, :through => :menu_menu_sections
  
  has_many :dish_menu_sections
  has_many :dishes, -> {uniq}, :through => :dish_menu_sections
  
  
end
