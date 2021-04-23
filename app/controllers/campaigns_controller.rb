class CampaignsController < ApplicationController

    def show
        @campaign = Campaign.find_by(id: params[:id])

    end

    def new
        @campaign = Campaign.new
    end

    def create 
        @campaign = Campaign.new(campaign_params)

    end

    def index
        @campaigns = current_user.campaigns

    end

    def edit

    end

    private

    def campaign_params
        params.require(:campaign).permit(:name, :schedule)
    end

end