class UsersController < ApplicationController
  def index
    @users = User.where("name ILIKE ?", "%#{params[:query]}%")
  end

  def show
    @user = User.find(params[:id])
  end
end
