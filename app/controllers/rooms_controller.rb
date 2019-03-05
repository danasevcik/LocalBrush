class RoomsController < ApplicationController
  # skip_before_action
  # skip_before_action :painter_authorized?, except: [:new]
  # before_action :check_privileges, only: [:new]

  def index
    @rooms = Room.all
  end

  # def check_privileges
  #   #if I'm a painter redirect to an error page else redirect to the new page
  # end

  def show
    # byebug
    @room = Room.find(params[:id])
    @user = User.find(session[:this_session_number])
  end

  def new
    @room = Room.new
    @user = User.find(session[:this_session_number])
    @users = User.all
  end

  def create
    # byebug
    room = Room.create(area: params[:room][:area], user_id: session[:this_session_number])
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
