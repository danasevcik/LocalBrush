class ProjectsController < ApplicationController

  # def new
  #   @project = Project.new
  #   # @room = Room.find(params[:id])
  # end

  def create

    # project = Project.new
    byebug
    project = Project.create()
    #session something
    #user id will be taken from params
    #change room status to assigned? true
  end

end
