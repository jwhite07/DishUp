class UserSerializer < ActiveModel::Serializer
  attributes :id, :name,  :username, :email, :avatar, :default_location, :auth_token, :updated_at
end
