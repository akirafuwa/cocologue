class DashboardsController < ApplicationController
  before_action :require_user_logged_in

  def index
    if logged_in?
      @user = current_user
      @diary = current_user.diaries.build #form_for用
      @diaries = current_user.diaries.order('created_at DESC').page(params[:page])
    end
  end
end
