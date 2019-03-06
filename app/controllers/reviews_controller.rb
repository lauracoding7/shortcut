class ReviewsController < ApplicationController
  before_action :set_user

  def index
    # if params[:query].present?
    #   author = User.where("name ILIKE ?", "%#{params[:query]}%").first
    #   @reviews = Review.where(receiver: @user, author: author)
    # else
    @reviews = Review.where(receiver: @user)
    # end
  end

  def new
    @review = Review.new
    @review.barber_review = # true or false depending on who it writing the review
    @review.receiver = @user
  end

  def create # this needs to be updates
    @review = Review.new(review_params)
    review.author = current_user
    review.receiver =
    if @review.save
       redirect_to user_reviews_path(@user)
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



