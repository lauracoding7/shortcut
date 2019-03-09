class MessagesController < ApplicationController
  before_action :set_appointment

  def create
    @message = Message.new(message_params)
    @message.appointment = Appointment.find(params[:appointment_id])
    @message.author = current_user
    @message.receiver = [@message.appointment.barber, @message.appointment.client].reject { |user|
      user == @message.author
    }[0]
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
