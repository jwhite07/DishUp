class DietClaim < ActiveRecord::Base
  belongs_to :diet_type
  belongs_to :dish
end
