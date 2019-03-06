class UsersController < ApplicationController
  def index
    sql_query = " \
        users.name @@ :query \
        OR users.host_service_address @@ :query"
    @users = User.joins(:services).where(sql_query, query: "%#{params[:query]}%")
  end

  def show
    @user = User.find(params[:id])
  end
end



