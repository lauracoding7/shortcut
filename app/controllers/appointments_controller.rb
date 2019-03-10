class AppointmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: :new
  before_action :set_barber, only: [:new, :create]
  before_action :set_service, only: [:new, :create]

  def show
    @appointment = Appointment.find(params[:id])
    @marker = {
      lng: @appointment.location_longitude,
      lat: @appointment.location_latitude
    }
    @message = Message.new
  end

  def new
    @appointment = Appointment.new
  end

  def create
    fixed_appt_params = appointment_params
    at_barber_host_location = fixed_appt_params.delete(:at_barber_host_location)
    @appointment = Appointment.new(fixed_appt_params)
    @appointment.client = current_user
    @appointment.service = @service
    @appointment.barber = @service.barber
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

  def approve
    Appointment.find(params[:id]).update(state: 'approved')
    redirect_to appointment_path(Appointment.find(params[:id]))
  end

  def reject
    Appointment.find(params[:id]).update(state: 'rejected')
    redirect_to appointment_path(Appointment.find(params[:id]))
  end

  def pay
    Appointment.find(params[:id]).update(state: 'paid')
    redirect_to appointment_path(Appointment.find(params[:id]))
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
