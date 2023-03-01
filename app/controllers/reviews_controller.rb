class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @mountain = Mountain.find(params[:mountain_id])
    @reviews = @mountain.reviews
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to mountain_reviews_path(@review.mountain)
    else
      @mountain = Mountain.find(params[:mountain_id])
      render "mountains/show"
    end
  end

  private
  def review_params
    params.require(:review).permit(:mountain_id, :title, :content, :score, :level, :time, :image)
  end
end
