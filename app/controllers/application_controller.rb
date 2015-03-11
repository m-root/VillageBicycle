class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def log_in(user)
    session[:token] = user.session_token
  end

  def log_out!
    current_user.reset_session_token!
    session[:token] = nil
  end

  def current_user
    return nil if session[:token].nil?
    User.find_by(session_token: session[:token])
  end

  def logged_in?
    !!current_user
  end

  def require_logged_in
    redirect_to new_sessions_url unless logged_in?
  end

  def set_categories
    @categories = Category.all
  end

  def set_sizes
    @sizes = Size.all
  end

  def set_neighborhoods
    @neighborhoods = Neighborhood.all
  end
end
