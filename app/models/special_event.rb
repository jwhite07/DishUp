class SpecialEvent < ActiveRecord::Base
  scope :only_active, -> {where("start_date < ? AND end_date > ? AND launch_screen = ?", DateTime.now, DateTime.now, true)}
  has_many :restaurants, :through => :menus
  has_and_belongs_to_many :locations
  has_many :menus
  
end
