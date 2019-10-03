class DashboardsController < ApplicationController
  before_action :require_user_logged_in, :set_current_user
  
  def index
    if logged_in?
      @diary = current_user.diaries.build
      if params[:year_month].nil?
        requested = Date.today
        @requested = Date.today
        @diaries = current_user.diaries.where(diary_date: requested.in_time_zone.all_month).order(diary_date: :desc)
        @subtracted = subtract_a_month(requested)
      elsif Date.strptime(params[:year_month], '%Y-%m').month < Date.today.month
        requested = Date.strptime(params[:year_month], '%Y-%m')
        @requested = Date.strptime(params[:year_month], '%Y-%m')
        @diaries = current_user.diaries.where(diary_date: requested.in_time_zone.all_month).order(diary_date: :desc)
        @subtracted = subtract_a_month(requested)
        @added = add_a_month(requested)
      else
        redirect_to '/dashboard'
      end
    end
  end
end
