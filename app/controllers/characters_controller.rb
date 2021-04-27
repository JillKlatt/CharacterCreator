require 'pry'

class CharactersController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update]
    #before_action :set_characters, only: [:index]
    before_action :set_campaign, only: [:index, :new, :create, :show]

    def index
       if @campaign
        binding.pry
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
        else
            @character = Character.new
            @races = Race.all
            @categories = Category.all
        end
    end

    def create
        @character = Character.new(character_params)
        #binding.pry
        @character.category_id = params[:character][:category_id][1]
        @character.race_id = params[:character][:race_id][1]
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
    end

    def update
        @character = Character.find_by(id: params[:id])
        @character.update(character_params)
        binding.pry

        if @character.valid?
            redirect_to character_path(@character)
        else
            flash[:message] = "#{@character.errors.full_messages.join(', ')}"
            render :edit
        end
    end

    def show
        @character = Character.find_by(id: params[:id])
    end

    def delete
        @character = Character.find_by(id: params[:id])
        @character.destroy
        redirect_to characters_path
    end

    private

    def character_params
        params.require(:character).permit(:name, :age, :description, :category_id, :race_id, :user_id, :id)
        #category_attributes: [:name, :trait], race_attributes: [:name, :trait],
    end

    def set_characters
        @characters = current_user.characters
    end

    def set_campaign
        @campaign = Campaign.find_by(id: params[:id])
    end

end