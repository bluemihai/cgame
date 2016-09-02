Rails.application.routes.draw do
  resources :rsvps
  resources :locations
  resources :games
  resources :activities
  resources :users
  root to: 'activities#index'
  get '/w_c' => 'visitors#wildcard', as: :wildcard
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
