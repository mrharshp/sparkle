class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @user = User.find(params[:user_id])
    @reviews = Review.where(user: @user)
     @sum = @user.reviews.map {|review| review.rating}.sum
     @avg = (@sum.to_f / @user.reviews.length)
  end

  def new
    @user = User.find(params[:user_id])
    @review = Review.new
  end

  def create
    @user = User.find(params[:user_id])
    @review = Review.new(review_params)
    @review.user = @user
    if @review.user != current_user
      if @review.save
        redirect_to user_reviews_path(@user)
      else
        flash[:alert] = "Something went wrong :("
        render :new
      end
    else
      flash[:alert] = "Stop reviewing yourself!"
      redirect_to user_reviews_path(@user)
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to user_reviews_path(@user)
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :user_id, :rating)
  end
end
