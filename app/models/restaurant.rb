class Restaurant < ActiveRecord::Base
  
  has_many :menus
  validates_associated :menus
  has_many :dishes
  
  validates :name, :address, :city, :state, presence: true
  
  
  
end
