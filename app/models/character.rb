class Character < ApplicationRecord
    belongs_to :category
    belongs_to :race

    accepts_nested_attributes_for :race
    accepts_nested_attributes_for :category

    def race_name
        self.try(:race).try(:name)
    end

    def race_name=(race)
        race = Race.find_or_create_by(name: name)
        self.race = race
    end
end
