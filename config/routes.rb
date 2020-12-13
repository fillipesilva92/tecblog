Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
  
  get '/posts/search/:title', to: 'posts#search'

  resources :posts do
    resources :comments
  end
  
  resources :comments
  
  get '/categories/:name', to: 'categories#filtered'


end
