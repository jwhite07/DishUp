class DishSerializer < ActiveModel::Serializer
  cache key: "dish", expires_in: 1.hours, except: [:location]
  attributes :id, :name, :price, :rating, :description,  :updated_at, :user_rating, :location
  has_many :dishpics, serializer: DishpicPreviewSerializer
  
  def user_rating
    user_rating = DishRating.where(user_id: @current_user).first if @current_user
    if user_rating.nil?
      return nil
    else
      return user_rating.rating
    end
  end
  def location
    if @options[:serializer_params][:location_id]
      location = object.restaurant.locations.where(location_id: @options[:serializer_params][:location_id] ).first
      
      if location
        location
      else
        object.restaurant.locations.first
      end
    elsif @options[:serializer_params][:latitude] && @options[:serializer_params][:longitude]
      object.restaurant.locations.near(@options[:serializer_params][:latitude], @options[:serializer_params][:longitude])
    else
      object.restaurant.locations.first
    end
  end
end
