class Dishpic < ActiveRecord::Base
  belongs_to :dish
  belongs_to :user
  has_many :dishpics_ingredients
  has_many :ingredients, :through => :dishpics_ingredients
  has_many :dishpic_quality_ratings
  
  validates :url, presence: true
  validates :quality_score, numericality: {
    greater_than_or_equal_to: 0, 
    less_than_or_equal_to: 5
  }
  default_scope {order('quality_score DESC')}
  
end
