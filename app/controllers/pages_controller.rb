require 'time'

class PagesController < ApplicationController
  def home
    # @user = User.new #why does the homepage need a User? for the form?
  end

  def dashboard
    @user = Appointment.where(barber: current_user)
  end

  def dashboard_upcoming
    upcoming = Appointment.where(barber: current_user)
    @appointments = upcoming.select { |appointment| appointment.datetime >= Time.now }
    render :dashboard
  end

  def dashboard_previous
    previous = Appointment.where(barber: current_user)
    @appointments = previous.select { |appointment| appointment.datetime < Time.now }
    render :dashboard
  end
end
