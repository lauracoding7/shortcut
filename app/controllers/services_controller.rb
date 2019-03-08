class ServicesController < ApplicationController
  before_action :set_user

  def index
    @services = Service.where(barber: @user)
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
