class ReviewsController < ApplicationController
  before_action :set_review , only: [:edit,:update,:destroy,:show]
  skip_before_action :authenticate_user!, only: [:show,:index]

  def show
    gon.score = ["#{@review.sharpness}", "#{@review.richness}", "#{@review.sourness}", "#{@review.bitterness}", "#{@review.sweetness}"]
  end

  def index
    @reviews = Review.limit(4).order(" created_at DESC ")
    # @your_reviews = Review.limit(4).order(" created_at DESC ").where(user_id: current_user.id)
    # @highest_reviews Review.limit(4).order(" sweetness + sourness + bitterness + sharpness + richness ASC ")
    # a = [:sweetness, :sourness, :bitterness, :sharpness, :richness]
    # @total = a.sum

    @search = Review.ransack(params[:q])
    @search_result = @search.result
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

  def edit
    if @review.user_id != current_user.id
      redirect_to reviews_path(@review)
    end
  end

  def update
    redirect_to reviews_path if @review.user_id != current_user.id
    if @review.update(review_params)
      redirect_to reviews_path
    else
      render 'edit'
    end
  end

  def destroy
    if @review.user_id == current_user.id
      @review.destroy
      redirect_to reviews_path
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:name, :maker, :text, :sharpness, :richness, :sourness, :bitterness, :sweetness, :user_id, :image).merge(user_id: current_user.id)
  end
end
