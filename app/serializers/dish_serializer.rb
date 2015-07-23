class DishSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :rating, :description, :updated_at
  has_many :dishpics
end
