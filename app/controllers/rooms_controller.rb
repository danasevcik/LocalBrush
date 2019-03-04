class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @user = @room.user
  end

  def new
    @room = Room.new
    @users = User.all
  end

  def create
    room = Room.create(room_params)
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
