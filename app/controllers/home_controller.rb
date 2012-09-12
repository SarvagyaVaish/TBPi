class HomeController < ApplicationController

  before_filter RubyCAS::Filter, :only => [:login_with_CAS]

  def login_with_google
    uid = request.env['omniauth.auth']['uid'].to_s
    if !Member.find_by_gtusername(uid).nil?
      session[:cas_user] = uid
      redirect_to :controller => 'events', :action => 'index'
    else
      flash[:notice] = "Admins Only: Please login using the Georgia Tech Tau Beta Pi Google account!"
      redirect_to :controller => 'events', :action => 'index'
    end
  end

  def oauth_failure
    flash[:notice] = "Please allow the TBPi Attendance application to log you in using the Google account!"
    redirect_to :controller => 'events', :action => 'index'
  end

  def login_with_CAS
    if Member.find_by_gtusername(session[:cas_user]).nil?
      flash[:notice] = "Welcome new user! Please fill out these details to get started"
      redirect_to :controller => 'members', :action => 'new', :newUser => 'true', :gtusername => session[:cas_user]
      return
    end

    respond_to do |format|
      format.html { redirect_to :controller => 'events', :action => 'index' }
      format.json { render json: @events }
    end
  end

  def logout
    RubyCAS::Filter.logout(self, "http://google.com") 
    reset_session
    return
  end

end
