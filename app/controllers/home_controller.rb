class HomeController < ApplicationController
  def index
    @upcoming_events = Event.upcoming.limit(5).order(:start_time)
    @today_events = Event.today.order(:start_time)
    @recent_events = Event.past.limit(3).order(start_time: :desc)
    
    #calendar data for the current month
    @current_month = Date.current.beginning_of_month
    @events_this_month = Event.where(
      start_time: @current_month..@current_month.end_of_month
    ).order(:start_time)
    
    #quick stats for dashboard
    @stats = {
      total_events: Event.count,
      completed_events: Event.completed.count,
      upcoming_events: Event.upcoming.count,
      events_today: Event.today.count
    }
  end
end