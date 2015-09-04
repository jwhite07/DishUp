class MenuSection < ActiveRecord::Base
  belongs_to :restaurant
  has_many :menu_assignments
  has_many :menus, :through => :menu_assignments
  has_many :dishes, :through => :menu_assignments
  
end
