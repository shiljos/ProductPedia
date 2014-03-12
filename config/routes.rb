ProductPedia::Application.routes.draw do
  devise_for :users
  root to: 'high_voltage/pages#show', id: 'homepage'
  resources :products
  #get '/products/show', to 'products#index'
end
