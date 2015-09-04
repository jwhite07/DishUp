class MenuAssignment < ActiveRecord::Base
  belongs_to :menu
  belongs_to :menu_section
  belongs_to :dish
end
