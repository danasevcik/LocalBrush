class ReviewsController < ApplicationController
  skip_before_action :painter_authorized?
  skip_before_action :user_authorized?
  # get started with this

  def new
    @review = Review.new
    # byebug
  end

  def create
    Review.create(painter_id: params[:review][:painter_id], content: params[:review][:content], rating: params[:review][:rating])
    #revist later for final customer experience
    redirect_to user_path(session[:this_session_number])
  end

end
