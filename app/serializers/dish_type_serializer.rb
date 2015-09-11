class DishTypeSerializer < ActiveModel::Serializer
  cache key: "dish_type", expires_in: 1.hours
  attributes :id, :name, :description, :icon_url, :updated_at
end
