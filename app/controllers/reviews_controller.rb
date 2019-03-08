class ReviewsController < ApplicationController
  before_action :set_user

  # def index
  #   @reviews = Review.where(receiver: @user)
  # end
  # I think we don't need a reviews#index, but for now I leave it here. However, I did get rid of the route, to keep things clean. We can add it back later if needed - Filippo

  def new
    @review = Review.new(barber_review: true)
    @review.receiver = @user
  end

  def new_client_review # this action will be triggered by a button on the barber's dashboard if we get to code it
    @review = Review.new(barber_review: false)
    @review.receiver = @user
    render :new
  end

  def create
    @review = Review.new(review_params)
    @review.author = current_user
    @review.receiver = @user
    if @review.save
      redirect_to user_path(@user)
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
