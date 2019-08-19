Rails.application.routes.draw do
  get 'create', to: 'events#create'
  get 'events(/:title)', to: 'events#show'
  get 'events', to: 'events#index'
  root 'pages#home'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'profile', to: 'users#show'
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:create, :show, :index]
end
