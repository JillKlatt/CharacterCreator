class Weapon < ApplicationRecord
    belongs_to :user
    has_many :character_weapons
    has_many :characters, through: :character_weapons

    validates :name, presence: true

end
