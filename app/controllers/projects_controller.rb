class ProjectsController < ApplicationController

  # def new
  #   @project = Project.new
  #   # @room = Room.find(params[:id])
  # end

  def create

    # project = Project.new

    project = Project.create(user_id: params[:user_id], painter_id: session[:painter_id])
    byebug
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
