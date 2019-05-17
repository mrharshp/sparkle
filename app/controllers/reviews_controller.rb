class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
    @review = Review.new

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.save
    render 'items'
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    render 'items'
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :user_id)
  end

end
