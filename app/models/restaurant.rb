class Restaurant < ActiveRecord::Base
  after_save :add_default_menu
  has_many :menus
  validates_associated :menus
  has_many :dishes
  
  validates :name, :address, :city, :state, presence: true
  
  def add_default_menu
    Menu.where(restaurant_id: self.id).first_or_create do |menu|
      menu.name = self.name
      menu.restaurant_id = self.id
    end
  end
  
  
end
