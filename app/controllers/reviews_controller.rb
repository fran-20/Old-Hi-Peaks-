class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @mountain = Mountain.find(params[:mountain_id])
    @review = Review.new
  end

  def create
    @mountain = Mountain.find(params[:mountain_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.image.attach(params[:review][:image])
    if @review.save
      redirect_to mountain_path(@mountain)
    else
      @mountain = Mountain.find(params[:mountain_id])
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
    if @review.user != current_user
      redirect_to reviews_path, alert: '不正なアクセスです。'
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to review_path(@review), notice: '更新に成功しました。'
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_back(fallback_location: root_path)
  end


  private
  def review_params
    params.require(:review).permit(:mountain_id, :start, :end, :nights, :score, :level, :title, :content, :image)
  end
end
