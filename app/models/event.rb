class Event < ActiveRecord::Base
  belongs_to :calendar
  has_event_calendar

  # To specify the columns to use call it like this:
  # 
  # has_event_calendar :start_at_field  => 'custom_start_at', :end_at_field => 'custom_end_at'
  # 
  
end