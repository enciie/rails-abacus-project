class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    #If user exists AND password is correct
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      # Sends user back to the login form
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
