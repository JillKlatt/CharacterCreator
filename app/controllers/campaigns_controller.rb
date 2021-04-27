class CampaignsController < ApplicationController

    def show
        @campaign = Campaign.find_by(id: params[:id])
        # byebug
        @characters = current_user.characters
        #@adventure = @campaign.adventures.build(campaign_id: @campaign.id)
    end

    def new
        @campaign = Campaign.new
        @characters = current_user.characters
        @character = @campaign.characters.build(user_id: current_user.id)
        @categories = Category.all
        @races = Race.all
    end

    def create 
        @campaign = Campaign.new(campaign_params)
        @campaign.user_id = current_user.id
        binding.pry
        if @campaign.save
            redirect_to campaigns_path
        else
            flash[:message] = "#{@campaign.errors.full_messages.join(', ')}"
            render :new
        end
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
        else
            flash[:message] = "#{@campaign.errors.full_messages.join(', ')}"
            render :edit
        end
    end


    private

    def campaign_params
        params.require(:campaign).permit(:name, :schedule, :description, :user_id, :id, :adventure_admin, character_ids: [], character_attributes: [:name, :age, :race, :category, :description])
    end

end