class ApplicationController < ActionController::Base
end
# app/controllers/application_controller.rb

def default_url_options
  { host: ENV["HOST"] || "localhost:3000" }
end
