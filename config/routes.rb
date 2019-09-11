Rails.application.routes.draw do
  get 'invitations/show'
  root 'pages#home'
  get 'create', to: 'events#new'
  post 'create', to: 'events#create'
  get 'events', to: 'events#index'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'profile', to: 'users#show'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'invites', to: 'invitations#index'
  post 'invites', to: 'invitations#create'
  delete 'invited', to: 'invitations#destroy'
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:index, :show, :create]
  resources :invitations, only: [:index, :create, :destroy]
end
