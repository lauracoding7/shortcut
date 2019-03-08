class AppointmentsController < ApplicationController
  before_action :set_barber, only: [:new, :create]
  before_action :find_service, only: [:new, :create]

  def show
    @appointment = Appointment.find(params[:id])
    @messages = @appointment.messages
    @message = Message.new
    @marker = {
      lng: @appointment.location_longitude,
      lat: @appointment.location_latitude,
    }
    if @appointment.state == 'pending'
      show_pending
    elsif @appointment.state == 'approved'
      show_approved
    elsif @appointment.state == 'rejected'
      show_rejected
    elsif @appointment.state == 'paid'
      show_paid
    end

  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.barber_id = @user.id
    @appointment.client_id = current_user.id
    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      render :new
    end
  end


  def index
    #this method will be needed for the dashboar and it will have to send to the view both @appointments and @markers, for the maps to work. An example of how to send multiple markers to the view can be found in the users controller, but the view will have to deal with this differently from the users view, because the markers will have to appear in different maps.
  end

  def show_pending
    render :show_pending
  end

  def show_approved
    render :show_approved
  end

  def show_rejected
    render :show_rejected
  end

  def show_paid
    render :show_paid
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
