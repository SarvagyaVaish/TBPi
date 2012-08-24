class ApplicationController < ActionController::Base
  protect_from_forgery

  # before_filter RubyCAS::Filter

  def current_user
    CUSTOM_LOG.debug "*******************   IN CURRENT USER METHOD    *******************"
    begin
      if session[:cas_user]
        @current_user ||= Member.find_by_gtusername(session[:cas_user])
        if @current_user.nil?
          @current_user = Member.new
        end
        # TODO fix this to give correct current user
        # @current_user ||= Member.find_by_gtusername('svaish3')
      else
        @current_user = Member.new
      end
      return @current_user
    rescue
      session[:cas_user] = nil
    end
  end
  helper_method :current_user

end
