class DishSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :rating, :description, :updated_at
end
