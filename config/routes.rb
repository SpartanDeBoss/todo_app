Rails.application.routes.draw do
  devise_for :users
  
  # Define the root path route ("/")
  root "home#index"
  
  # Define routes for tasks resources
  resources :tasks
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  # Define a route for the home index
  get 'home/index'
end