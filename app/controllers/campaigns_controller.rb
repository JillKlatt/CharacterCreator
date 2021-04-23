class CampaignsController < ApplicationController

    def show
        @campaign = Campaign.find_by(id: params[:id])

    end

    def new
        @campaign = Campaign.new
    end

    def create 
        @campaign = Campaign.new(campaign_params)
        @campaign.user_id = current_user.id
        binding.pry
        @campaign.save
            redirect_to campaigns_path
         #else
        #    render :new
        #end
    end

    def index
        @campaigns = Campaign.all

    end

    def edit

    end

    private

    def campaign_params
        params.require(:campaign).permit(:name, :schedule, :description)
    end

end