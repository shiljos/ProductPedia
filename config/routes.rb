ProductPedia::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'high_voltage/pages#show', id: 'homepage'
  resources :products, only: [:index, :show, :update, :delete] do
    member do
      post 	  'favorite'
      delete  'remove_favorite'
  	end
  end
  #resources :free_products, only: :show
  #match 'free_products', to: 'products#show',   via: :get
  #match 'products', to: 'products#index',  via: :get
end
