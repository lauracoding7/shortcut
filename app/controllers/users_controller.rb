class UsersController < ApplicationController
  def index
    if params[:query].present?
      sql_query = "users.name @@ :query"
      barbers_matching_name = User.joins(:services).where(sql_query, query: "%#{params[:query]}%")
      unless barbers_matching_name.empty?
        @users = barbers_matching_name.uniq
        return
      end
      # at this stage, all barbers matching name, wherever they are located will appear in the search. If we want to filter out the ones that are too far from the user's location, we need to do something like:
      # hosting_barbers_matching_name = barbers_matching_name.near(params[:query], 10, latitude: :host_service_latitude, longitude: :host_service_longitude)
      # commuting_barbers_matching_name = barbers_matching_name.near(params[:query], :commute_area_radius, latitude: :commute_area_latitude, longitude: :commute_area_longitude)
      # @users = (hosting_barbers + commuting_barbers).uniq

      searched_location = Geocoder.search(params[:query]).first

      hosting_barbers_matching_address = User.near(params[:query], 10, latitude: :host_service_latitude, longitude: :host_service_longitude)
      commuting_barbers_matching_address = User.near(params[:query], :commute_area_radius, latitude: :commute_area_latitude, longitude: :commute_area_longitude)
      unless hosting_barbers_matching_address.empty? && commuting_barbers_matching_address.empty?
        @users = (hosting_barbers_matching_address + commuting_barbers_matching_address).uniq
        return
      end
      @users = []
    else
      @users = User.joins(:services)
    end
  end

  def show
    @user = User.find(params[:id])
  end
end



