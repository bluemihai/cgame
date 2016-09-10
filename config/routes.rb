Rails.application.routes.draw do
  resources :participations
  resources :groups
  resources :rounds
  resources :haikus
  resources :rsvps
  resources :locations
  resources :games
  resources :activities
  resources :users
  root to: 'activities#menu'
  get '/wild_*^@_cards' => 'activities#wildcards', as: :wildcards
  get '/menu' => 'activities#menu', as: :menu
  get '/w_c' => 'visitors#wildcard', as: :wildcard
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
