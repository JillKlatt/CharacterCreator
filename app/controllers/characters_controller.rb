class CharactersController < ApplicationRecord

    def index
        @characters = current_user.characters
    end

    def new
        @character = Character.new
    end

    def create
        @character = Character.new(character_params)

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

    private

    def character_params
        params.require(:character).permit(:name, :age, :description, :category_id, :race_id, :category_attributes: [:name, :trait], :race_attributes: [:name, :trait])
    end

end