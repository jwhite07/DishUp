class MenuMenuSection < ActiveRecord::Base
  belongs_to :menu
  belongs_to :menu_section
end
