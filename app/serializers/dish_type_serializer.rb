class DishTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :icon_url, :updated_at
end
