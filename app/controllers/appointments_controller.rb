class AppointmentsController < ApplicationController
  before_action :set_barber, only: [:new, :create]
  before_action :set_service, only: [:new, :create]

  def show
    @appointment = Appointment.find(params[:id])
    @marker = {
      lng: @appointment.location_longitude,
      lat: @appointment.location_latitude
    }
  end

  def new
    @appointment = Appointment.new
  end

  def create
    fixed_appt_params = appointment_params
    at_barber_host_location = fixed_appt_params.delete(:at_barber_host_location)
    @appointment = Appointment.new(fixed_appt_params)
    @appointment.barber = @user
    @appointment.client = current_user
    @appointment.service = @service
    if at_barber_host_location
      @appointment.location_address = @user.host_service_address
    else
      @appointment.location_address = appointment_params[:location_address]
    end
    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      render :new
    end
  end

  private

  def set_barber
    @user = User.find(params[:user_id])
  end

  def set_service
    @service = Service.find(params[:service_id])
  end

  def appointment_params
    params.require(:appointment).permit(:location_address, :datetime, :at_barber_host_location)
  end
end
