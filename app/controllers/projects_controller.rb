class ProjectsController < ApplicationController

  # def new
  #   @project = Project.new
  #   # @room = Room.find(params[:id])
  # end

  def create
    byebug
    project = Project.create(user_id: params[:user_id], painter_id: session[:painter_id])
    #change the room assignment to true
    #won't show up in room index anymore
    room = Room.find(params[:room_id])
    byebug
    room.update(assigned?: true)
    redirect_to rooms_path




    # byebug

    #session something
    #user id will be taken from params
    # session[:painter_id] =
    #change room status to assigned? true

  end

  private

  def project_params
    params.require(:project).permit(user_id:  params[:user_id], painter_id: session[:painter_id])
  end

end
