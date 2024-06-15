Rails.application.routes.draw do
  root 'tasks#index'
  
  resources :tasks

  resources :sessions, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]

  #get '/login', to: 'sessions#new', as: 'new_session'
  #post '/login', to: 'sessions#create'
  #delete '/logout', to: 'sessions#destroy'
  #get '/signup', to: 'users#new', as: 'new_user'
end


