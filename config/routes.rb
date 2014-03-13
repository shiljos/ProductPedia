ProductPedia::Application.routes.draw do
  devise_for :users
  root to: 'high_voltage/pages#show', id: 'homepage'
  resources :products, only: [:index, :show, :update] do
    member do
      post 'favorite'
  	end
  end
end
