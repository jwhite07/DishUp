class DishSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :rating, :description,  :updated_at, :user_rating, :location
  has_many :dishpics, serializer: DishpicPreviewSerializer
  def user_rating
    puts @current_user
    user_rating = DishRating.where(user_id: @current_user).first if @current_user
    if user_rating.nil?
      return nil
    else
      return user_rating.rating
    end
  end
  def location
    if @latitude && @longitude
      object.restaurant.locations.near(@latitude, @longitude)
    else
      object.restaurant.locations.first
    end
  end
end
