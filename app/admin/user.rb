ActiveAdmin.register User do
  permit_params :name, :username, :avatar, :email, :password, :password_confirmation
  

end
