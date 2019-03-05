class ProjectsController < ApplicationController
  skip_before_action :user_authorized?
  skip_before_action :painter_authorized?
  # skip_before_action :authorized
  # def new
  #   @project = Project.new
  #   # @room = Room.find(params[:id])
  # end

  def create
    # byebug
    project = Project.create(user_id: params[:user_id], painter_id: session[:this_session_number])
    #change the room assignment to true
    #won't show up in room index anymore
    room = Room.find(params[:room_id])
    # byebug
    room.update(assigned?: true)
    redirect_to rooms_path
  end

  private

  def project_params
    params.require(:project).permit(user_id:  params[:user_id], painter_id: session[:this_session_number])
  end

end
