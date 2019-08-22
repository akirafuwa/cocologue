Rails.application.routes.draw do
  root to: 'dashboards#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'

  resources :users, only: [:show, :new, :create]
  resources :diaries, only: [:create, :destroy]
  resources :symptoms, only: [:index, :new, :create, :show, :delete, :edit]
  resources :memories, only: [:index, :new, :create, :edit, :delete]
end
