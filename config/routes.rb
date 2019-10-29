Rails.application.routes.draw do
  root to: 'dashboards#index'
  get '/dashboard', to: 'dashboards#index'
  get '/dashboard/:year_month', to: 'dashboards#index', constraints: {
    year_month:   /\d{4}-\d{1,2}/
  }

  get 'statistics/period/:period', to: 'statistics#report_by_period' , constraints:  Constraint::PeriodConstraint.new
  get 'statistics/from/:date_begin/to/:date_end', to: 'statistics#report_by_date', constraints: Constraint::DateConstraint.new
  get 'statistics', to: 'statistics#report_by_period'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'

  resources :users, only: [:show, :new, :create]
  resources :diaries, only: [:new, :create, :destroy]
  resources :symptoms, only: [:index, :new, :create, :show, :delete, :edit]
  resources :memories, only: [:index, :new, :create, :edit, :delete]
end
