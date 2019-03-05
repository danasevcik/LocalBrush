class LoginController < ApplicationController
  skip_before_action :painter_authorized?
  skip_before_action :user_authorized?

  def home
    render :home
  end

end
