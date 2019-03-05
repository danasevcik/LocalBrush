class ReviewsController < ApplicationController
  skip_before_action :painter_authorized?
  skip_before_action :user_authorized?
  # get started with this

end
