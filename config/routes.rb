Rails.application.routes.draw do
  get '/categories/:name', to: 'categories#filtered'

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'

  resources :posts do
    resources :comments
  end
  
  resources :comments

end
