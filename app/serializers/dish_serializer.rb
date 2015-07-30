class DishSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :rating, :description, :updated_at, :user_rating
  has_many :dishpics
  def user_rating
    user_rating = DishRating.where(user_id: @current_user).first
    if user_rating.nil?
      return nil
    else
      return user_rating.rating
    end
  end
end
