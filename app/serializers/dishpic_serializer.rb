class DishpicSerializer < ActiveModel::Serializer
  attributes :id, :dish_id, :user, :favorites, :quality_score, :caption, :url 
end
