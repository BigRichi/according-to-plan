class PhotosController < ApplicationController

    def index
    end

    def create 
        Photo.create(picture_url: params[:photo][:picture_url], event_id: flash[:event_id])
        redirect_to event_path(flash[:event_id])
    end

    def destroy 
        photo = Photo.find(params[:id])
        photo.destroy 
        redirect_to event_path(flash[:event_id])
    end

end
