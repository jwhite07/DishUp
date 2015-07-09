Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api, defaults: { format: :json } do
                                
      scope module: :v1 do
        resources :users, :only => [:show, :create, :update]
      end
    end
end
