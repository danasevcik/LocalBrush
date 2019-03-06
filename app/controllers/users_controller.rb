class UsersController < ApplicationController
  skip_before_action :painter_authorized?
  skip_before_action :user_authorized?, only: [:login, :new, :create]

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

    def mypainters
      @my_projects = Project.all.where(user_id: session[:user_id]).to_a
      # @my_projects = User.find(session[:user_id])
      # byebug
      render :mypaint
    end

    def myroom
      @my_rooms = Room.all.where(user_id: session[:user_id]).to_a
    end



  # edit user page


  private

  def user_params
    params.require(:user).permit(:username, :password, :name, :zip_code, :email, :house_style)
  end

end
