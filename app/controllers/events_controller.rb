class EventsController < ApplicationController

    before_action :set_event, only: [:show, :destroy, :edit, :update]
    
    def index
        @event = Event.new
            if params[:event] && params[:event][:category_ids] 
                @events = @current_user.upcoming_five_events.select {|event| event.category_ids.include?(params[:event][:category_ids].to_i) }
            elsif params.has_key?(:select)
                @events = @current_user.events.select{|event| event.date.year == params[:select][:year].to_i && event.date.month == params[:select][:month].to_i}
            else
                @events = @current_user.upcoming_five_events
            end
        @event_errors = flash[:event_errors]
        @quote = Quote.all.sample.quote
    end

    def all_events
        @all_events = @current_user.events.sort_by(&:date)
    end

    def create
        event = @current_user.events.create(event_params)
        EventCategory.create(event_id: event.id, category_id: params[:event][:category_ids])
            if event.valid?
                redirect_to event_path(event)
            else
                flash[:event_errors] = event.errors.full_messages
                redirect_to events_path
            end
    end

    def show
        @event_category = EventCategory.new
        @categories = Category.all
        flash[:event_id] = @event.id
        @events = @current_user.events
        @category_errors = flash[:category_errors]
        @photo = Photo.new
    end
    
    def edit 
    end

    def update 
        @event = Event.find(params[:id])
        @event.update(event_params)
        redirect_to event_path(@event)
    end

    def destroy 
        @event.destroy 
        redirect_to events_path
    end
    
    private

    def set_event
        @event = @current_user.events.find(params[:id])
    end
     
    def event_params
        params.require(:event).permit(:title, :description, :address, :date)
    end  

end
