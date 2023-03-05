class MountainsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
    if params[:sort_top_review]
      @mountains = Mountain.all.each do |mountain|
        mountain.average = mountain.avg_score
      end
      @mountains = @mountains.sort_by { |mountain| mountain.average }.reverse
    else
      @mountains = Mountain.all
    end
  end

  def show
    @mountain = Mountain.find(params[:id])
    @review = Review.new
  end
end