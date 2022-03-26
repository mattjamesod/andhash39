Rails.application.routes.draw do
  get "/about", to: "about#index"
  root "posts#most_recent"
  
  resources :posts
end
