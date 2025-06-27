class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :toggle_complete]
  
  def index
    @events = Event.all.order(:start_time)
    
    @events = @events.by_type(params[:type]) if params[:type].present?
    
    case params[:status]
    when 'upcoming'
      @events = @events.upcoming
    when 'past'
      @events = @events.past
    when 'completed'
      @events = @events.completed
    when 'pending'
      @events = @events.pending
    end
    
    @event_types = Event.distinct.pluck(:event_type).compact
  end
  
  def show
  end
  
  def new
    @event = Event.new
    #default start time is next hour
    @event.start_time = Time.current.beginning_of_hour + 1.hour
    @event.end_time = @event.start_time + 1.hour
  end
  
  def create
    @event = Event.new(event_params)
    
    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
  end
  
  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @event.destroy
    redirect_to events_path, notice: 'Event was successfully deleted.'
  end
  
  def toggle_complete
    @event.toggle_completion!
    redirect_back(fallback_location: events_path)
  end
  
  private
  
  def set_event
    @event = Event.find(params[:id])
  end
  
  def event_params
    params.require(:event).permit(:title, :description, :start_time, :end_time, :event_type, :completed)
  end
end
