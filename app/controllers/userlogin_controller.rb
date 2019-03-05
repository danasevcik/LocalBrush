class UserloginController < ApplicationController

  def login
    render 'user_login_page'
  end

  def create #handles the POST request to /user_login
  # find out if we have a user with this username
  @user = User.find_by(username: params[:username])
  # get that@user record from DB
  # authenticate this@user; determine if they provided the correct pw
    if @user && @user.authenticate(params[:password])
      # once we have found the@user, create a new session for them
      session[:user_id] = @user.id
      # redirect_to user_path(@user)
      redirect_to @user
    else
      flash[:notice] = 'Invalid username or password'
      redirect_to user_login_path
    end
  end

end
