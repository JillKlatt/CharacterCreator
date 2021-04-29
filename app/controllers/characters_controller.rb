require 'pry'

class CharactersController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update]
    before_action :set_characters, only: [:index]
    before_action :set_campaign, only: [:index, :new, :create, :show]
    before_action :set_character, only: [:show, :destroy]

    def index
       if @campaign
        #binding.pry
            @characters = @campaign.characters
       else
            @characters = current_user.characters
       end
    end

    def new
        if @campaign
            @character = @campaign.characters.build
            @races = Race.all
            @categories = Category.all
            @weapons = current_user.weapons
        else
            @character = Character.new
            @races = Race.all
            @categories = Category.all
            #binding.pry
            @weapons = current_user.weapons
        end
    end

    def create
        @character = Character.new(character_params)
        #binding.pry
        # @character.category_id = params[:character][:category_id]
        # @character.race_id = params[:character][:race_id]
        @character.user_id = current_user.id

        if @character.save
            if @campaign
               redirect_to campaign_character_path(@character)

            else
                redirect_to character_path(@character)
            end
        else 
            flash[:message] = "#{@character.errors.full_messages.join(', ')}"
            render :new
        end

    end

    def edit                              
        @character = Character.find_by(id: params[:id])
        @races = Race.all
        @categories = Category.all
        binding.pry
        @weapons = current_user.weapons
    end

    def update
        @character = Character.find_by(id: params[:id])
        @character.update(character_params)
  
        #binding.pry

        if @character.valid?
            redirect_to character_path(@character)
        else
            flash[:message] = "#{@character.errors.full_messages.join(', ')}"
            render :edit
        end
    end

    def show
        
    end

    def destroy
        @character.destroy
        flash[:message] = "Character Deleted"
        redirect_to characters_path
    end

    def search
        @characters = current_user.characters.search(params[:name])
        binding.pry
        render :index
    end

    def last_updated
        @characters = current_user.characters.last_updated
    end

    private

    def character_params
        params.require(:character).permit(:name, :age, :description, :category_id, :race_id, :user_id, :id, character_weapon_notes: [], weapon_ids: [])
        #category_attributes: [:name, :trait], race_attributes: [:name, :trait],
    end

    def set_characters
        @characters = current_user.characters
    end

    def set_character
        @character = Character.find_by(id: params[:id])
    end

    def set_campaign
        @campaign = Campaign.find_by(id: params[:id])
    end

end