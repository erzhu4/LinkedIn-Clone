class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :logged_in?

  def login(user)
    if user
      user.reset_token
      session[:token] = user.session_token
      user.save
      @current_user = user
    else
      return nil
    end
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:token])
    @current_user
  end

  def logged_in?
    if self.current_user && self.current_user.session_token == session[:token]
      return true
    else
      return false
    end
  end


end
