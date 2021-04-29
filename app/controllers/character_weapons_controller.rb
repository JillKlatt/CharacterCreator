class CharacterWeaponsController < ApplicationController

    def new

        @character = Character.find_by(id: params[:id])
        @weapon = Weapon.find_by(id: params[:id])
    end

    def create
        @character_weapon = CharacterWeapon.new(character_weapon_params)
        #byebug
        @character_weapon.character_id = params[:character_weapon][:character_id]
        @character_weapon.weapon_id = params[:character_weapon][:weapon_id]
    
        
        @character_weapon.save
        #binding.pry
        character = @adventure.character_id
        redirect_to character_path(character)
    end

    def show
        
    end

    private

    def character_weapon_params
        params.require(:character_weapon).permit(:weapon_id, :character_id)
    end

end