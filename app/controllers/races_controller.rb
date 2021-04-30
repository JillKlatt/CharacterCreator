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
                redirect_to races_path
            else
                redirect_to :new
            end
    end

    def show
        @race = Race.find_by(id: params[:id])
    end

    def edit                              
        @race = Race.find_by(id: params[:id])
    end

    def update
        @race = Race.find_by(id: params[:id])
        @race.update(race_params)

  
        #binding.pry

        if @race.valid?
            redirect_to races_path
        else
            render :edit
        end
    end

    def destroy
        @race = Race.find_by(id: params[:id])
        @race.destroy
        flash[:message] = "Race Deleted"
        redirect_to races_path
    end

    private

    def race_params
        params.require(:race).permit(:name, :trait, :jills_opinion)
    end
end