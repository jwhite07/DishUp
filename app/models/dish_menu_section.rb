class DishMenuSection < ActiveRecord::Base
  belongs_to :dish
  belongs_to :menu_section
end
