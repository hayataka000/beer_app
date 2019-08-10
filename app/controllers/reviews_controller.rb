class ReviewsController < ApplicationController
  def index
    @reviews = Review.limit(4).order(" created_at DESC ")
    @your_reviews = Review.limit(4).order(" created_at DESC ").where(user_id: current_user.id)
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
    params.require(:review).permit(:name, :maker, :text, :sharpness, :richness, :sourness, :bitterness, :sweetness, :user_id).merge(user_id: current_user.id)
  end
end
