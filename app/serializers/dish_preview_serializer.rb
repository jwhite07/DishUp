class DishPreviewSerializer < ActiveModel::Serializer
  cache key: "dish", expires_in: 1.hours
  attributes :id, :name, :price, :rating, :description, :updated_at, :user_rating, :lead_dishpic_url
  
  def user_rating
    user_rating = DishRating.where(user_id: @current_user).first if @current_user
    if user_rating.nil?
      return nil
    else
      return user_rating.rating
    end
  end
  
end
