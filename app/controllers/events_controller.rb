class EventsController < ApplicationController

    def index
        @event = Event.new
        @events = @current_user.upcoming_five_events
        @all_events = @current_user.events
       # @filtered_events = @all_events #-----.find(:all, :order => ', id', :limit => 50)
        @event_months = @all_events.group_by { |events| events.date.month }
    end

    def create
        @current_user.events.create(event_params)
        redirect_to events_path
    end

    def show
        @event = Event.find(params[:id])
    end
    
    private
     
    def event_params
        params.require(:event).permit(:title, :description, :address, :date)
    end  

end
