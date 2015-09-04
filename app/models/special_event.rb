class SpecialEvent < ActiveRecord::Base
  scope :only_active, -> {where("start_date < ? AND end_date > ? AND launch_screen = ?", DateTime.now, DateTime.now, true)}
  has_many :restaurants, :through => :menus
  has_many :menus
  
end
