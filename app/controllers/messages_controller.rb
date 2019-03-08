class MessagesController < ApplicationController
  before_action :set_appointment

  def index
    @messages = Message.where(appointment_id: set_appointment)
  end

  def new
    @appointment = Appointment.find(params[:appointment_id])
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.author = current_user
    @message.receiver = @appointment.receiver_for(current_user)
    @message.appointment = Appointment.find(params[:appointment_id])
    if @message.save!
       redirect_to appointment_path(@appointment)
    else
      render :new
    end
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:appointment_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
