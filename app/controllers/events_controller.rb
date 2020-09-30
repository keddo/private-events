class EventsController < ApplicationController
    before_action :set_event, except: %i[index new create]
    def index
        @events = Event.all.order('created_at DESC')
        @popular_events = Event.first(2)
    end
    def new
      @event = Event.new
    end
    def create
        users = User.all.count
        event_creator = rand(1..users)
       @event = current_user.events.build(event_params)  # Event.new(event_params)
       @event.creator_id = event_creator
       if @event.save
          flash[:success] = "Event created successfully"
          redirect_to events_path
       else
          render :new
       end
    end
    def show
    end
    def edit
    end
    def update
    end
    def destory
    end

    private
    def event_params
        params.require(:event).permit(:eventdate, :eventdescription, :eventlocation, :eventname, :creator_id)
    end

    def set_event
        @event = Evnet.find(params[:id])
    end
end
