class RacesController < ApplicationController

        #display available races, find or create by new ones

    def index
        @races = Race.all
    end

    def new
        @race = Race.new
    end

    def create
        @race = Race.new(race_params)
            if @race.save
                redirect_to characters_path
            else
                redirect_to :new
            end
    end

    def show
        @race = Race.find_by(id: params[:id])
    end

    private

    def race_params
        prarams.require[:race].permit(:name, :trait)
    end
end