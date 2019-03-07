class PagesController < ApplicationController
  def home
    @user = @User.new
  end

  def dashboard
  end

  def dashboard_upcoming
  end

  def dashboard_previous
  end
end
