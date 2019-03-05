class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def new
    @room = Room.new
    @user = User.find(session[:user_id])
    @users = User.all
  end

  def create
    # byebug
    room = Room.create(area: params[:room][:area], user_id: session[:user_id])
    if room.valid?
      redirect_to rooms_path
    else
      flash[:errors] = room.errors.full_messages
      redirect_to new_room_path
    end
  end

  private

  def room_params
    params.require(:room).permit(:area, :user_id, :assigned?)
  end

end
