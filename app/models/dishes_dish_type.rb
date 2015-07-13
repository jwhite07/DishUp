class DishesDishType < ActiveRecord::Base
  belongs_to :dish
  belongs_to :dish_type
end