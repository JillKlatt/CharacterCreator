class CampaignsController < ApplicationController

    def show
        @campaign = Campaign.find_by(id: params[:id])
        @characters = current_user.characters
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
        @campaigns = current_user.campaigns

    end

    def edit
        @campaign = Campaign.find_by(id: params[:id])
        @characters = current_user.characters
    end

    def update
        @campaign = Campaign.find_by(id: params[:id])
        @campaign.update(campaign_params)

        if @campaign.valid?
                redirect_to campaign_path(@campaign)
        end
    end

    private

    def campaign_params
        params.require(:campaign).permit(:name, :schedule, :description)
    end

end