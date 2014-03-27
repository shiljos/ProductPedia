ProductPedia::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'high_voltage/pages#show', id: 'homepage'
  resources :products, only: [:index, :show, :new, :create, :update, :delete] do
    member do
      post 	  'favorite'
      delete  'remove_favorite'
  	end
  end
  resources :product_steps
  match 'ingredients',    to: 'ingredients#index',      via: :get
  match 'nutritions',     to: 'nutritions#index',       via: :get
  match 'distributers',   to: 'distributers#index',     via: :get
  match 'manufacturers',  to: 'manufacturers#index',    via: :get


  #match 'products', to: 'products#index',  via: :get
end
