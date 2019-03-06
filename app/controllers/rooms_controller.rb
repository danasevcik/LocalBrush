class RoomsController < ApplicationController
  skip_before_action :painter_authorized?
  skip_before_action :user_authorized?

  def index
    @rooms = Room.all
  end

  # def check_privileges
  #   #if I'm a painter redirect to an error page else redirect to the new page
  # end

  def show
    # byebug
    @room = Room.find(params[:id])
    @user = @room.user
    if session[:user_id]
      render 'show_for_user'
    elsif session[:painter_id]
      render :show
    end
  end

  def new
    @room = Room.new
    @user = User.find(session[:user_id])
    @users = User.all
  end

  def create
    # byebug
    room = Room.create(area: params[:room][:area], user_id: session[:user_id], image: params[:room][:image])
    if room.valid?
      redirect_to rooms_path
    else
      flash[:errors] = room.errors.full_messages
      redirect_to new_room_path
    end
  end

  # def upload
  #   room = Room.create(area: params[:room][:area], user_id: session[:user_id])
  #   uploaded_io = params[:room][:picture]
  #   File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
  #     file.write(uploaded_io.read)
  #   end
  #   File.rename("public/uploads/#{uploaded_io.original_filename}","public/uploads/#{room.user.username}#{room.id}.png")
  # end

  private

  def room_params
    params.require(:room).permit(:area, :user_id, :assigned?, :image)
  end

end
