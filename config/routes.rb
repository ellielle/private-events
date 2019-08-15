Rails.application.routes.draw do
  root 'pages#home'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#new'
  resources :users, only: [:new, :create, :show]
end
