class ApplicationController < ActionController::Base
  #before_action :authorized #lock down this whole app
  before_action :painter_authorized?
  before_action :user_authorized?

  # skip_before_action :user_authorized?
  # skip_before_action :painter_authorized?

  helper_method :current_user #i can call current_user from a view
  helper_method :current_painter #i can call current_painter from a view

  def current_user
    # User.find would throw an error if we cannot find the user
    User.find_by({ id: session[:user_id] })
  end

  def current_painter
    # Painter.find would throw an error if we cannot find the painter
    Painter.find_by({ id: session[:painter_id] })
  end

  def user_logged_in?
    # nil is falsey in ruby
    # a user instance is truthy
    !!current_user
  end

  def painter_logged_in?
    # nil is falsey in ruby
    # a painter instance is truthy
    !!current_painter
  end


  def user_authorized?
    redirect_to homepage_path unless user_logged_in?
  end

  def painter_authorized?
    redirect_to homepage_path unless painter_logged_in?
  end


end
