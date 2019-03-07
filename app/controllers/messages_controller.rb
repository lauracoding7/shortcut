class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
      @message = Message.find(params[:id])
  end

  def new
    @appointment = Appointment.find(params[:appointment_id])
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = User.find(params[:receiver_id])
    @message.appointment = Appointment.find(params[:appointment_id])
    @message.save
  end
  private

  def message_params
    params.require(:message).permit(:content)
  end
end
