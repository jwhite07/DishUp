class UserSerializer < ActiveModel::Serializer
  #cache key: "user", expires_in: 1.hours
  attributes :id, :name, :auth_token, :email
  
end
#