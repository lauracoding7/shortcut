class ReviewsController < ApplicationController
  before_action :set_user

  def index
    @reviews = Review.where(receiver: @user)
  end

  def new
    @review = Review.new
    @review.receiver = @user
  end

  def create # this needs to be updated
    @review = Review.new(review_params)
    @review.author = current_user
    @review.receiver = @user
    @review.barber_review = current_user.is_client?
    if @review.save
      if current_user.is_client?
        redirect_to user_path(@user)
      else
        raise "Not implemented yet!"
        # redirect_to user_reviews_path(@user)
      end
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :barber_review)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end



