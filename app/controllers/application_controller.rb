class ApplicationController < ActionController::Base
  protect_from_forgery

  # before_filter RubyCAS::Filter

  def current_user
    begin
      # if session[:cas_user]
        @current_user ||= Member.find_by_gtusername(session[:cas_user])
        # TODO fix this to give correct current user
        @current_user ||= Member.find_by_gtusername('svaish3')
      # else
        # @current_user = Member.new
      # end
      logger.debug "*******   CURRENT USER   *******"
      logger.debug @current_user
      return @current_user
    rescue
      session[:cas_user] = nil
    end
  end
  helper_method :current_user

end
