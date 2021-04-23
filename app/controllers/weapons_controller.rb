class WeaponsController < ApplicationRecord
    
    def index
        @weapons = Weapon.all
    end

    def show
        @weapon = Weapon.find_by(id: params[:id])
    end

    def new
        @weapon = Weapon.new
    end

    def create
        @weapon = Weapon.new(weapon_params)
        redirect_to weapons_path
    end

    private

    def weapon_params
        params.require(:weapon).permit(:name, :description, :damage)
    end
end