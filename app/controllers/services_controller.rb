class ServicesController < ApplicationController
  before_action :set_user

  def index
    @services = Service.where(barber: @user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end



