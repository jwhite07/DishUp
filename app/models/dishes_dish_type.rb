class DishesDishType < ActiveRecord::Base
  belongs_to :dish
  belongs_to :dish_type, :counter_cache => :dishes_count
end