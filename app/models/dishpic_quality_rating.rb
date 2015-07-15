class DishpicQualityRating < Rating
  belongs_to :dishpic
  validates :dishpic_id, presence: true
  validates :user_id, uniqueness: { scope: [ :dishpic_id ] }
  
  
  
  
end
