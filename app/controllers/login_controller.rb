class LoginController < ApplicationController
  skip_before_action :painter_authorized?
  skip_before_action :user_authorized?

  def home
    session[:user_id] = nil
    session[:painter_id] = nil
    render :home
  end

end
