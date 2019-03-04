class UsersController < ApplicationController

  def login
    render 'login'
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.create(user_params)
    if user.valid?
      redirect_to user
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_path
    end
  end

  # edit user page


  private

  def user_params
    params.require(:user).permit(:name, :zip_code, :email, :house_style)
  end

end
