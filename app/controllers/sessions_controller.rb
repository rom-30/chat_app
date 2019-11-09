class SessionsController < ApplicationController
  def new

  end

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
end
