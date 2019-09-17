class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    include SessionsHelper
    include DashboardHelper
    include DiariesHelper

    private

    def set_current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def require_user_logged_in
      unless logged_in?
        redirect_to login_url
      end
    end
end
