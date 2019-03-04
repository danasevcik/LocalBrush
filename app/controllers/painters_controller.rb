class PaintersController < ApplicationController

  def new
    @painter = Painter.new
  end

  def show
    @painter = Painter.find(params[:id])
  end

  def create
    painter = Painter.create(painter_params)
    if painter.valid?
      redirect_to painter
    else
      flash[:errors] = painter.errors.full_messages
      redirect_to new_painter_path
    end
  end

  private

  def painter_params
    params.require(:painter).permit(:name, :zip_code, :email, :y_of_exp)
  end

end
