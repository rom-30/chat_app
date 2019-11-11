class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: %i[new create]

  def new; end

  def create
    user = User.find_by(username: params[:session][:username])

    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully signed in"
      redirect_to root_path
    else
      flash.now[:error] = "Try again but this time with the correct credentials okay!!!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully signed out"

    redirect_to login_path
  end

  private

  def redirect_if_logged_in
    if logged_in?
      flash[:error] = "You are already logged in"
      redirect_to root_path
    end
  end
end
