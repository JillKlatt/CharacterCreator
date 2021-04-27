class AdventuresController < ApplicationController

    def new

        @character = Character.find_by(id: params[:id])
        @campaign = Campaign.find_by(id: params[:id])
    end

    def create
        @adventure = Adventure.new(adventure_params)
        binding.pry
        self.campaign_id = params[campaign_id]
        self.character_id = params[character_id]
        redirect_to campaigns_path
    end

    private

    def adventure_params
        params.require(:adventure).permit(:campaign_id, :character_id)
    end

end