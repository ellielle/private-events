Rails.application.routes.draw do
  root 'pages#home'
  get 'create', to: 'events#new'
  post 'create', to: 'events#create'
  get 'events(/:slug)', to: 'events#show'
  get 'events', to: 'events#index'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'profile', to: 'users#show'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users, only: [:new, :create, :show]
end
