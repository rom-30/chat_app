class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      flash[:error] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end

  private

  # def logged_in?
  #   !!current_user
  # end

  # def current_user
  #   @current_user ||=
  #     session[:current_user_id] &&
  #     User.find_by(id: session[:current_user_id])
  # end

  # def require_login
  #   unless logged_in?
  #     flash[:error] = "You must be logged in to perform this action"
  #     redirect_to login_path
  #   end
  # end
end
