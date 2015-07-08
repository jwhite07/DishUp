class Restaurant < ActiveRecord::Base
  has_many :menus
  validates_associated :menus
  has_many :dishes, through: :menus
  
  validates :name, :address, :city, :state, presence: true
  
  
end
