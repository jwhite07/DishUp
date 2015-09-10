class DishPreviewSerializer < ActiveModel::Serializer
  #cache key: "dishpreview", expires_in: 1.hours, except: [:special_event_id, :location_id]
  attributes :id, :name, :price, :rating, :description, :updated_at, :user_rating, :lead_dishpic_url, :special_event_id, :location_id
  
  def user_rating
    user_rating = DishRating.where(user_id: @current_user).first if @current_user
    if user_rating.nil?
      return nil
    else
      return user_rating.rating
    end
  end
  def special_event_id
    special_event_id = @options[:serializer_params][:special_event_id]
    if special_event_id
      special_event_id
    else
      nil
    end
  end
  def location_id
    special_event_id = @options[:serializer_params][:special_event_id]
    if special_event_id
      SpecialEvent.find(special_event_id).locations.first
    else
      nil
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
