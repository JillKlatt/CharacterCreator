class WeaponsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_weapon, only: [:show, :destroy]
    
    def index
        @weapons = current_user.weapons
    end

    def show
    end

    def new
        @weapon = Weapon.new
    end

    def create
        @weapon = Weapon.new(weapon_params)
        current_user.weapons << @weapon
        redirect_to weapons_path
    end

    def destroy
        @weapon.destroy
        redirect_to weapons_path
    end

    private

    def weapon_params
        params.require(:weapon).permit(:name, :description, :damage)
    end

    def set_weapon
        @weapon = Weapon.find_by(id: params[:id])
    end
end