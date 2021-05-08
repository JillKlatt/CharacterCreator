require 'pry'

class CharactersController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_characters, only: [:index]
    before_action :set_campaign, only: [:index, :new, :create, :show, :destroy]
    before_action :set_character, only: [:edit, :update, :show, :destroy]
    before_action :set_races_and_categories_and_weapons, only: [:new, :create, :edit, :update]
    before_action :set_campaigns, only: [:new, :create, :edit, :update]
    before_action :destroy_associations, only: [:destroy]

    def index
       if @campaign
            @characters = @campaign.characters
       else
            @characters = current_user.characters
       end
    end

    def new
        if @campaign
            @character = @campaign.characters.build
        else
            @character = Character.new
        end
    end

    def create
        if @campaign
            @character = @campaign.characters.build(character_params)
            if @character.save
                @campaign.characters << @character
                redirect_to campaign_path(@campaign)
            else 
                render :new
            end
  
        else 
            @character = Character.new(character_params)
            if @character.save
                redirect_to character_path(@character)
            else 
                render :new
            end
        end
    end

    def edit                              
    end

    def update

     
        if @character.update(character_params)
            # redirect_to character_path(@character)
            # redirect_to '/characters/#{id}'
            # Will know to direct to show
            redirect_to @character
        else
            render :edit
        end
    end

    def show
    end

    def destroy
        @character.destroy
            if @character.destroy
            flash[:message] = "Character Deleted"
            redirect_to characters_path
            else
                flash[:message] = @character.errors.full_messages.join(" ")
            end
    end

    def search
        @characters = current_user.characters.search(params[:name])
        # binding.pry
        render :index
    end

    def last_updated
        @characters = current_user.characters.last_updated
    end

    private

    def character_params
        params.require(:character).permit(:name, :age, :description, :category_id, :race_id, :user_id, :id, :campaign_id, campaign_ids: [], character_weapon_notes: [], weapon_ids: [])
        #category_attributes: [:name, :trait], race_attributes: [:name, :trait],
    end

    def set_characters
        @characters = current_user.characters
    end

    def set_character
        @character = Character.find_by(id: params[:id])
    end

    def set_campaign
        @campaign = Campaign.find_by(id: params[:campaign_id])
    end

    def set_races_and_categories_and_weapons
        @races = Race.all
        @categories = Category.all
        @weapons = current_user.weapons
    end

    def destroy_associations
        @character.adventures.destroy_all
        @character.character_weapons.destroy_all
    end

    def set_campaigns
        @campaigns = current_user.campaigns
    end


end