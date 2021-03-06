# frozen_string_literal: true

# Rails super class for app controllers
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :start_timer
  def start_timer
    @start_time = Time.now
  end
end
