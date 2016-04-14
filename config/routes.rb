Rails.application.routes.draw do
  resources :tools

  resources :users, only: [:new, :create, :destroy, :show]

  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
end
