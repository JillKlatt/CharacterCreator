class CampaignsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_campaign, only: [:show, :edit, :update, :destroy]
    before_action :destroy_adventures, only: [:destroy]
    before_action :set_characters, only: [:new, :create, :edit, :update, :show]

    def show
    end

    def new
        @campaign = Campaign.new
        @character = @campaign.characters.build(user_id: current_user.id)
        @categories = Category.all
        @races = Race.all
    end

    def create 
        @campaign = Campaign.new(campaign_params)
        @campaign.user_id = current_user.id
        # @character = Character.new(campaign_params[:character_attributes])
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
        @characters = current_user.characters
    end

    def update
        @campaign.update(campaign_params)

        if @campaign.valid?
                redirect_to campaign_path(@campaign)
        else
            flash[:message] = "#{@campaign.errors.full_messages.join(', ')}"
            render :edit
        end
    end

    def destroy
        @campaign.destroy
            if @campaign.destroy
                flash[:message] = "Campaign Deleted"
                redirect_to campaigns_path
            else
                flash[:message] = @campaign.errors.full_messages.join(" ")
            end
    end


    private

    def campaign_params
        params.require(:campaign).permit(:name, :schedule, :description, :user_id, :id, :adventure_admin, character_ids: [], character_attributes: [:name, :age, :race, :category, :description])
    end

    def destroy_adventures
        @campaign.adventures.each do |adventure|
            adventure.destroy
        end
    end

    def set_campaign
        @campaign = Campaign.find_by(id: params[:id])
    end

    def set_characters
        @characters = current_user.characters
    end

    
end


