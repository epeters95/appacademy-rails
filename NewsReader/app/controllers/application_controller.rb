class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :signed_in?, :current_user
  
  def signed_in?
    !session[:session_token].nil?
  end
  
  def sign_in(user)
    session[:session_token] = user.generate_session_token!
  end
  
  def sign_out
    session[:session_token] = nil
  end
  
  def current_user
    return nil unless session[:session_token]
    @current_user || User.find_by_session_token(session[:session_token])
  end
end
