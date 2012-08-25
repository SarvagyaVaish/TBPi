class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  def current_user
    begin
      @current_user ||= Member.find_by_gtusername(session[:cas_user]) if session[:cas_user]
      @current_user
    rescue
      session[:cas_user] = nil
    end
  end
  helper_method :current_user

end
