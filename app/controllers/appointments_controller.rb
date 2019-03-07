class AppointmentsController < ApplicationController
  before_action :set_barber, only: [:new, :create]
  before_action :find_service, only: [:new, :create]

  def show
    @appointment = Appointment.find(params[:id])
    @marker = {
      lng: @appointment.location_longitude,
      lat: @appointment.location_latitude,
    }
  end

  def new
    @appointment = Appointment.new
    @appointment_request = Appointment.new
  end

  def create
    @appointment_request = Appointment.new(appointment_params)
    @appointment_request.barber_id = @user.id
    @appointment_request.client_id = current_user.id
    if @appointment_request.save
      redirect_to appointment_path(@appointment)
    else
      render :new
    end
  end

  def index
    #this method will be needed for the dashboar and it will have to send to the view both @appointments and @markers, for the maps to work. An example of how to send multiple markers to the view can be found in the users controller, but the view will have to deal with this differently from the users view, because the markers will have to appear in different maps.
  end

  private

  def set_barber
    @user = User.find(params[:user_id])
  end
  def find_service
    @service = Service.find(params[:service_id])
  end
  def appointment_params
    params.require(:appointment).permit(:location_address, :datetime)
  end
end
