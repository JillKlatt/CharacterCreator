class WeaponsController < ApplicationController
    
    def index
        @weapons = current_user.weapons
    end

    def show
        @weapon = Weapon.find_by(id: params[:id])
    end

    def new
        @weapon = Weapon.new
    end

    def create
        @weapon = Weapon.new(weapon_params)
        @weapon.user_id = current_user.id
        @weapon.save
        redirect_to weapons_path
    end

    private

    def weapon_params
        params.require(:weapon).permit(:name, :description, :damage)
    end
end