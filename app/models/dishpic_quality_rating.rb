class DishpicQualityRating < Rating
  belongs_to :dishpic
  validates :dishpic_id, presence: true
  validates :user_id, uniqueness: { scope: [ :dishpic_id ] }
  
  after_save :update_dishpic_rating
  private
    def update_dishpic_rating
      dishpic = self.dishpic
      c = dishpic.dishpic_quality_ratings.count
      sum = dishpic.dishpic_quality_ratings.sum(:rating)
      logger.debug "Rating preround: #{sum/c}, postround: #{(sum/c).round(2)}"
      dishpic.quality_score = (sum * 1.00/ c).round(2)
      dishpic.save
    end
  
  
end
