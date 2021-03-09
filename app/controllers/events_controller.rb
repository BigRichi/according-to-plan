class EventsController < ApplicationController

    def index
        @events = @current_user.events
        @event = Event.new
        @calendar_dates = CalendarDate.all
    end

    def new
        # @event = Event.new
        # @calendar_dates = CalendarDate.all
    end

    def create
        event = Event.create(event_params)
        redirect_to event_path(event_params[:event_id])
    end
    

    private
     
    def event_params
        params.require(:event).permit!
    end  

end
