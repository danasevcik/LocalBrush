class PainterloginController < ApplicationController
  skip_before_action :user_authorized?
  skip_before_action :painter_authorized?, only: [:login, :create]

  def login
    render 'login'
  end

  def create #handles the POST request to /painter_login
  # find out if we have a painter with this username
  @painter = Painter.find_by(username: params[:username])
  # get that@painter record from DB
  # authenticate this@painter; determine if they provided the correct pw
    if @painter && @painter.authenticate(params[:password])
      # once we have found the@painter, create a new session for them
      session[:this_session_number] = @painter.id
      # redirect_to painter_path(@painter)
      redirect_to @painter
    else
      flash[:notice] = 'Invalid username or password'
      redirect_to painter_login_path
    end
  end

end
