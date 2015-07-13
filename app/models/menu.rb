class Menu < ActiveRecord::Base
  belongs_to :restaurant
  has_many :dishes_menus
  has_many :dishes, :through => :dishes_menus
  #validates_associated :dishes
  has_many :dishpics, :through => :dishes
  
  validates :name, :restaurant_id, presence: true
end
