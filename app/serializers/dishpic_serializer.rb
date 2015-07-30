class DishpicSerializer < ActiveModel::Serializer
  attributes :id, :dish_id, :user, :favorites, :quality_score, :caption, :url, :user_rating
  def user_rating
    user_rating = DishpicQualityRating.where(user_id: @current_user).first
    if user_rating.nil?
      return nil
    else
      return user_rating.rating
    end
  end
end
