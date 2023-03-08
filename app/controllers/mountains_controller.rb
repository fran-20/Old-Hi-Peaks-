class MountainsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
    @q = Mountain.ransack(params[:q])
    @mountains = @q.result.includes(:reviews)
    
    if params[:sort_top_review]
      @mountains = @mountains.sort_by { |mountain| mountain.avg_score }.reverse
    else
      @q = Mountain.ransack(params[:q])
      @mountains = @q.result.includes(:reviews)
    end
    
  end
  
  def show
    @mountain = Mountain.find(params[:id])
    @review = Review.new
  end
end