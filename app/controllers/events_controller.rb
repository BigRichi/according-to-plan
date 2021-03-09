class EventsController < ApplicationController

    def index
        @events = @current_user.events
        @event = @current_user.events.new
    end

    def new
        @event = @current_user.events.new
    end

    def create
        event = @current_user.events.create(event_params)
        redirect_to events_path
        # event_path(event_params[:event_id])
    end
    
    def show
        @event = @current_user.events.find(event_params[:event_id])
    end
    

    private
     
    def event_params
        params.require(:event).permit!
    end  

end
