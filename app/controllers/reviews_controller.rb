class ReviewsController < ApplicationController
  def index

  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to reviews_path
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:name, :maker, :text, :sharpness, :richness, :sourness, :bitterness, :sweetness)
  end
end
