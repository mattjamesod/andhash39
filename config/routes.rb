Rails.application.routes.draw do
  get "/about", to: "about#index"
  root "posts#most_recent"
  
  resources :posts
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'
end
