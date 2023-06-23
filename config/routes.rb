Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  resources :users 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "home#index"
  #root to: "statuses#index"
end
