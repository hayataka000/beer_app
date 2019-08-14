class ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
    gon.score = ["#{@review.sharpness}", "#{@review.richness}", "#{@review.sourness}", "#{@review.bitterness}", "#{@review.sweetness}"]
  end

  def index
    @reviews = Review.limit(4).order(" created_at DESC ")
    # @your_reviews = Review.limit(4).order(" created_at DESC ").where(user_id: current_user.id)
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
    @review = Review.find(params[:id])
    if @review.user_id != current_user.id
      redirect_to reviews_path(@review)
    end
  end

  def update
    redirect_to reviews_path if @review.user_id != current_user.id
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to reviews_path
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.user_id == current_user.id
      @review.destroy
      redirect_to reviews_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:name, :maker, :text, :sharpness, :richness, :sourness, :bitterness, :sweetness, :user_id, :image).merge(user_id: current_user.id)
  end
end
