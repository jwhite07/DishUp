class Menu < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :special_event
  
  has_many :menu_assignments
  has_many :dishes, -> {where("restaurant_id = ? ", object.restaurant_id)}, :through => :menu_assignments
  has_many :menu_sections, :through => :menu_assignments
  
  
  
  #validates_associated :dishes
  has_many :dishpics, :through => :dishes
  
  validates :name, :restaurant, presence: true
end
