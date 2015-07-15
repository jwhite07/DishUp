class DishRating < Rating
  belongs_to :dish
  
  validates :dish_id, :rating, :user_id, presence: true
  
  validates :user_id, uniqueness: { scope: [ :dish_id] }
  
  after_save :update_dish_rating
  private
    def update_dish_rating
      dish = self.dish
      c = dish.dish_ratings.count
      sum = dish.dish_ratings.sum(:rating)
      logger.debug "Rating preround: #{sum/c}, postround: #{(sum/c).round(2)}"
      dish.rating = (sum * 1.00/ c).round(2)
      dish.save
    end
  
end
