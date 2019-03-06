class AppointmentsController < ApplicationController
  before_action :set_barber, only: [:new, :create]
  before_action :find_service, only: [:new, :create]

  def show
    @appointments = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new

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
