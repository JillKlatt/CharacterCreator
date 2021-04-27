class AdventuresController < ApplicationController

    def new
        @character = Character.find_by(id: params[:id])
        @campaign = Campaign.find_by(id: params[:id])
    end

    def create
        self.campaign_id = params[campaign_id]
        self.character_id = params[character_id]
    end

end