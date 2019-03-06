class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
      @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    @message.save
  end
end
