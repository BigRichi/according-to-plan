class EventCategoriesController < ApplicationController


    def create 
        category_ids = params[:event_category][:category_id]
            category_ids.each do |category_id|
                if category_id != "" 
                    event_category = EventCategory.create(category_id: category_id, event_id: flash[:event_id])
                        if event_category.valid? == false
                            flash[:category_errors] = event_category.errors.full_messages
                        end
                end
            end
        redirect_to event_path(flash[:event_id])
    end

    private

    def event_category_params 
        params.require(:event_category).permit(:event_id, :category_id)
    end

end
