ProductPedia::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'high_voltage/pages#show', id: 'homepage'
  resources :products, only: [:index, :show, :new, :create, :edit, :update, :delete] do
    member do
      post 	  'favorite'
      delete  'remove_favorite'
  	end
    collection do
      get :autocomplete
    end
  end
  resources :product_imports do
    collection do
      post 'import'
    end
  end
  resources :product_steps
  match 'ingredients',    to: 'ingredients#index',      via: :get
  match 'nutritions',     to: 'nutritions#index',       via: :get
  match 'distributers',   to: 'distributers#index',     via: :get
  match 'manufacturers',  to: 'manufacturers#index',    via: :get
end
