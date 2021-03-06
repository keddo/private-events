class EventsController < ApplicationController
  before_action :set_event, except: %i[index new create]
  before_action :authenticate_user!

  def index
    @events = Event.all.order('created_at DESC')
    @prev_events = @events.prev_events
    @comming_events = @events.comming_events
    @popular_events = Event.first(3)
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params) # Event.new(event_params)
    if @event.save
      flash[:notice] = 'Event created successfully'
      redirect_to events_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update; end

  def destory; end

  private

  def event_params
    params.require(:event).permit(:eventdate, :eventdescription, :eventlocation, :eventname, :creator_id)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
