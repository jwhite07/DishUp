class Dishpic < ActiveRecord::Base
  belongs_to :dish
  belongs_to :user
  has_and_belongs_to_many :ingredients
  
end
