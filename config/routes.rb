Rails.application.routes.draw do
  root 'pages#home'
  get 'create', to: 'events#create'
  get 'events(/:title)', to: 'events#show'
  get 'events', to: 'events#index'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'profile', to: 'users#show'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:create, :show, :index]
end
