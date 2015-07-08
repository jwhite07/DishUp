class Menu < ActiveRecord::Base
  belongs_to :restaurant
  has_many :dishes
  has_many :dishpics, through: :dishes
  
  validates :name, :restaurant_id, presence: true
end
