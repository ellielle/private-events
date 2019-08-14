Rails.application.routes.draw do
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#new'
  resources :users, only: [:new, :create, :show]
end
