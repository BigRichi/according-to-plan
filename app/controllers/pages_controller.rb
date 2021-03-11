class PagesController < ApplicationController
    skip_before_action :authorized

    def home 
        if logged_in? 
            redirect_to events_path
        end
    end

end