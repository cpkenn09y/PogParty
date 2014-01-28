class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method  :logged_in?, :current_user

  def logged_in?
    session[:id] != nil
  end

  def current_user
    if logged_in?
      User.find(session[:id])
    end
  end
end
