Rails.application.routes.draw do
  root 'pages#home'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#new'
  get 'profile', to: 'users#show'
  resources :users, only: [:new, :create, :show]
end
