class PainterloginController < ApplicationController
  def login
    render 'painter_login_page'
  end

  def create #handles the POST request to /painter_login
  # find out if we have a painter with this username
  @painter = Painter.find_by(username: params[:username])
  # get that@painter record from DB
  # authenticate this@painter; determine if they provided the correct pw
  if @painter && @painter.authenticate(params[:password])
    # once we have found the@painter, create a new session for them
    session[:painter_id] = @painter.id
    # redirect_to painter_path(@painter)
    redirect_to @painter
  else
    flash[:notice] = 'Invalid username or password'
    redirect_to painter_login_path
  end
end

end
