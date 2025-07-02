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
    
    #weekly calendar data
    if params[:week].present?
      begin
        selected_week_start = Date.parse(params[:week]).beginning_of_week(:sunday)
      rescue Date::Error
        selected_week_start = Date.current.beginning_of_month(:sunday)
      end
    else
      selected_week_start = Date.current.beginning_of_week(:sunday)
    end

    selected_week_end = selected_week_start.end_of_week(:sunday)

    #get events for the selected week
    @events_this_week = Event.where(
      start_time: selected_week_start.beginning_of_day..selected_week_end.end_of_day
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