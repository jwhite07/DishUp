Rails.application.routes.draw do
  root "web_contents#index"
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  namespace :api, defaults: { format: :json } do
                                
    scope module: :v1 do
      resources :users, :only => [:show, :create, :update, :destroy]
      resources :sessions, :only => [:create, :destroy]
      resources :dish_types, :only => [:index, :show] do
        resources :dishes, :only => [:index]
      end
      
      resources :dishes, :only => [:index, :show, :update, :destroy, :create] do
        resources :dishpics, :only => [:index]
        resources :dish_ratings, :only => [:create]
      end
      resources :dish_ratings, :only => [:update]
      
      resources :dishpics, :only => [:index, :show] do
        resources :dishpic_quality_ratings, :only => [:create]
      end
      resources :dishpic_quality_ratings, :only => [:update]
      
      resources :restaurants, :only => [:index] do
        resources :dishes, :only => [:index]
      end
      resources :locations, :only => [:index] 
    
      
    end
  end
end
