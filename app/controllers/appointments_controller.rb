class AppointmentsController < ApplicationController
  before_action :set_receiver

  def show
    @appointments = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new

  end

  def create
    #need a user
    #need a author
    #need the params (location / adress / date)
    #user_id should be the current user
    @appointment_request = Appointment.new(appointment_params)
    @appointment_request.receiver_id = @user.id
    @appointment_request.author_id = current_user.id

    @appointment_request.save

  end


private

def set_receiver
  @user = User.find(params[:receiver_id])
end
def appointment_params
  params.require(:appointment).permit(:location_adress, :datetime)
end
end
