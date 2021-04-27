class AdventuresController < ApplicationController

    def new

        @character = Character.find_by(id: params[:id])
        @campaign = Campaign.find_by(id: params[:id])
    end

    def create
        @adventure = Adventure.new(adventure_params)
        #byebug
        #@adventure = Adventure.new(params)
        @adventure.campaign_id = params[:adventure][:campaign_id]
        @adventure.character_id = params[:adventure][:character_id]
        
        @adventure.save
        #binding.pry
        campaign = @adventure.campaign_id
        redirect_to campaign_path(campaign)
    end

    private

    def adventure_params
        params.require(:adventure).permit(:campaign_id, :character_id)
    end

end