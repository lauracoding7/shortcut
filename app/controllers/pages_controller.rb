require 'time'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :update_missed_appointments

  def home
  end

  def dashboard
    @user = current_user
    @appointments = Appointment.where(client: current_user)
    @reviews = Review.where(receiver: current_user)
  end

  def dashboard_upcoming
    @user = current_user
    upcoming = Appointment.where(client: current_user)
    @appointments = upcoming.select { |appointment| appointment.datetime >= Time.now }
    @markers = @appointments.map do |appointment|
      {
        lng: appointment.location_longitude,
        lat: appointment.location_latitude,
      }
    end
    render :dashboard
  end

  def dashboard_previous
    @user = current_user
    previous = Appointment.where(client: current_user)
    @appointments = previous.select { |appointment| appointment.datetime < Time.now }
    @markers = @appointments.map do |appointment|
      {
        lng: appointment.location_longitude,
        lat: appointment.location_latitude,
      }
    end
    render :dashboard
  end

  private

  def update_missed_appointments
    Appointment.where(client: current_user).where.not(state: 'paid').select { |appointment| appointment.datetime < Time.now }.each do |appt|
      appt.update(state: 'missed')
    end
  end
end
