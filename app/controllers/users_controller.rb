class UsersController < ApplicationController
  def index

    # @users = User.where(?)
  end

  def show
    @user = User.find(params[:id])
  end
end
