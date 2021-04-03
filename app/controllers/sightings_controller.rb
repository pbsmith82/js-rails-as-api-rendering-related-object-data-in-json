class SightingsController < ApplicationController
    

    def index
        sightings = Sighting.all
        render json: sightings, include: [:bird, :location], except: [:updated_at]
    end
    
    
    def show
        sighting = Sighting.find_by(id: params[:id])
        render json: sighting, :include => {
            :bird => {:only => [:name, :species]},
            :location => {:only => [:latitude, :longitude]}
        }
    end 


end
