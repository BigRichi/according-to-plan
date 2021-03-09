class EventCategoriesController < ApplicationController

    def create
       
        flash[:id]
        # byebug
        EventCategory.create(event_category_params)
        redirect_to event_path(flash[:id])
    end

    private

    def event_category_params
        params.require(:event_category).permit(:event_id => flash[:id], :category_id)
    end
end
