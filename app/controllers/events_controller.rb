class EventsController < ApplicationController

    def index
       
        @event = Event.new

        if params[:event] && params[:event][:category_ids] 
            @events = @current_user.upcoming_five_events.select{|event| event.category_ids.include?(params[:event][:category_ids].to_i) }
        else
            @events = @current_user.upcoming_five_events
        end
        @all_events = @current_user.events
      
    end

    def create
        
        event = @current_user.events.create(event_params)
        EventCategory.create(event: event, category_id: params[:event][:category_ids])
        redirect_to event_path(event)
    end

    def show
        @event = Event.find(params[:id])
        @event_category = EventCategory.new
        @categories = Category.all
        flash[:id] = @event.id
    end
    
    private
     
    def event_params
        params.require(:event).permit(:title, :description, :address, :date)
    end  

end
