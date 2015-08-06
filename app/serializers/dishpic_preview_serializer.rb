class DishpicPreviewSerializer < ActiveModel::Serializer
  attributes :id, :favorites, :quality_score, :caption, :url, :dish_id, :user_id
  def user_rating
    user_rating = DishpicQualityRating.where(user_id: @current_user).first
    if user_rating.nil?
      return nil
    else
      return user_rating.rating
    end
  end
end