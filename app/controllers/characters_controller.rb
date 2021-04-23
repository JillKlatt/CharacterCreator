require 'pry'

class CharactersController < ApplicationController
    
    #before_action :set_characters, only: [:index]

    def index
        @characters = Character.all
    end

    def new
        @character = Character.new
        @races = Race.all
        @categories = Category.all
    end

    def create
        @character = Character.new(character_params)
        binding.pry
        @character.category_id = params[:character][:category_id][1]
        @character.race_id = params[:character][:race_id][1]

        if @character.save
               redirect_to character_path(@character)
        else 
            render :new
        end

    end

    def edit
        @character = Character.find_by(id: params[:id])
    end

    def update
        @character = Character.find_by(id: params[:id])
        @character.update(character_params)

        if @character.valid?
            redirect_to character_path(@character)
        else
            render :edit
        end
    end

    def show
        @character = Character.find_by(id: params[:id])
    end

    private

    def character_params
        params.require(:character).permit(:name, :age, :description, :category_id, :race_id, category_attributes: [:name, :trait], race_attributes: [:name, :trait])
    end

    def set_characters
        @characters = current_user.characters
    end

    def set_campaign
        @campaign = Campaign.find_by(id: params[:id])
    end

end