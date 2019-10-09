Rails.application.routes.draw do
  root to: 'dashboards#index'
  get '/dashboard', to: 'dashboards#index'
  get '/dashboard/:year_month', to: 'dashboards#index', constraints: {
    year_month:   /\d{4}-\d{1,2}/
  }

  get 'statistics', to: 'statistics#report'
  get 'statistics/:column/period/:week_or_month', to: 'statistics#select_period', constraints: Constraint::SelectPeriodConstraint.new
  get 'statistics/:column/from/:date_begin/to/:date_end', to: 'statistics#select_date', constraints: Constraint::SelectDateConstraint.new

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'

  resources :users, only: [:show, :new, :create]
  resources :diaries, only: [:new, :create, :destroy]
  resources :symptoms, only: [:index, :new, :create, :show, :delete, :edit]
  resources :memories, only: [:index, :new, :create, :edit, :delete]
end
