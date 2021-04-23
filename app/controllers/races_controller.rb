class RacesController < ApplicationRecord

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
end