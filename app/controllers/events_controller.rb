class EventsController < ApplicationController
    before_action :set_event, except: %i[index new create]
    def index
    end
    def new
    end
    def create
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
        params.require(:user).permit(:eventdate, :eventdescription, :eventlocation, :eventname, :creator_id)
    end

    def set_event
        @event = Evnet.find(params[:id])
    end
end
