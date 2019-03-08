class ReviewsController < ApplicationController
  before_action :set_user

  def index
    @reviews = Review.where(receiver: @user)
  end

  def new
    @review = Review.new
    @review.receiver = @user
  end

  def create
    @review = Review.new(review_params)
    @review.author = current_user
    @review.receiver = @user
    @review.barber_review = current_user.is_client?
    if @review.save
      if current_user.is_client?
        redirect_to user_reviews_path(@user)
      else
        raise "Not implemented yet!"
      end
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end



