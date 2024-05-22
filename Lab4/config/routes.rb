Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users
  
  # Root route
  root "articles#index"
  
  # Nested resources for articles and comments, with only create and destroy actions for comments
  resources :articles do
    resources :comments, only: [:create, :destroy]
  end
end
