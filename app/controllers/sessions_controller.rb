class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(:email => params[:email])
    #If user exists AND password is correct
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      # Sends user back to the login form
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
