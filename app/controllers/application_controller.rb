class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    begin
      @current_user ||= Member.find_by_gtusername(session[:cas_user]) if session[:cas_user]
      logger.debug "*******   CURRENT USER   *******"
      logger.debug @current_user
    rescue
      session[:cas_user] = nil
    end
  end
  helper_method :current_user

end
