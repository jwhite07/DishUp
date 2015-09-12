class DishSerializer < ActiveModel::Serializer
  #cache key: "dish", expires_in: 1.hours, except: [:location]
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
      Rails.logger.debug "Location by id: #{location}"
      if location
        location
      else
        object.restaurant.locations.first
      end
    elsif @options[:serializer_params][:latitude] && @options[:serializer_params][:longitude]
      latitude = @options[:serializer_params][:latitude]
      longitude = @options[:serializer_params][:longitude]
      object.restaurant.locations.near([latitude, longitude], 99999, order: "distance").first
      
    else
      location = object.restaurant.locations.first
      Rails.logger.debug "Location by default: #{location}"
    end
  end
end
