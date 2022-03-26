Rails.application.routes.draw do
  root "posts#most_recent"
  
  resources :posts
end
