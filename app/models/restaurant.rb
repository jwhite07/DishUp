class Restaurant < ActiveRecord::Base
  has_many :menus
  has_many :dishes, through: :menus
end
