class CalendarController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @month = (params[:month] || Time.zone.now.month).to_i
    @year = (params[:year] || Time.zone.now.year).to_i

    @shown_month = Date.civil(@year, @month)

    @event_strips = Event.event_strips_for_month(@shown_month, @first_day_of_week = 1)

    @event = Event.new

  end

end