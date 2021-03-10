class EventCategoriesController < ApplicationController

    def create 
        # EventCategory.create(event_category_params)
        category_ids = params[:event_category][:category_id]
            category_ids.each do |category_id|
                # if category_id != ""
                EventCategory.create(category_id: category_id, event_id: flash[:event_id])
                # end
            end
        redirect_to event_path(flash[:event_id])

        # byebug
    end
    # params[:event_category][:category_id]
    private

    def event_category_params 
        params.require(:event_category).permit(:event_id, :category_id)
    end

    # def create
    #     flash[:id]
    #     EventCategory.create(event_category_params)
    #     redirect_to event_path(flash[:id])
    # end

    # private

    # def event_category_params
    #     params.require(:event_category).permit(:event_id => flash[:id], :category_id)
    # end
end
