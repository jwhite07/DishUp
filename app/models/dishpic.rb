class Dishpic < ActiveRecord::Base
  belongs_to :dish
  belongs_to :user
  has_many :dishpic_ingredients
  has_many :ingredients, :through => :dishpic_ingredients
  
  validates :url, presence: true
  validates :quality_score, numericality: {
    greater_than_or_equal_to: 0, 
    less_than_or_equal_to: 5
  }
  
end
