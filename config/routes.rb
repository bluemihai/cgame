Rails.application.routes.draw do
  resources :charges
  resources :containers
  resources :offerings
  resources :participations
  resources :groups
  resources :rounds
  resources :haikus
  resources :rsvps
  resources :locations
  resources :games do
    resources :rounds do
      resources :groups
    end
  end
  resources :activities
  resources :users
  root to: 'activities#menu'
  get '/wild_*^@_cards' => 'activities#wildcards', as: :wildcards
  get '/menu' => 'activities#menu', as: :menu
  get '/w_c' => 'visitors#wildcard', as: :wildcard
  get '/festival' => 'visitors#festival'
  get '/welcome' => 'visitors#welcome'
  get '/values' => 'visitors#values'
  get '/circlemeday' => 'visitors#circlemeday'
  get '/jordan' => 'visitors#jordan'
  get '/series' => 'visitors#series'
  get '/cobalt' => 'visitors#cobalt'
  get '/defaultcopy' => 'visitors#defaultcopy'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
