class Character < ApplicationRecord
    belongs_to :user
    belongs_to :category
    belongs_to :race

    has_many :character_weapons
    has_many :weapons, through: :character_weapons
    
    has_many :adventures
    has_many :campaigns, through: :adventures

    validates :name, presence: true
    validates :race, presence: true
    validates :category, presence: true

    # scope :search, -> (query) { self.where("name LIKE ?", "%#{query}%") }
    scope :last_updated, -> { order updated_at: :desc }


    # accepts_nested_attributes_for :race
    # accepts_nested_attributes_for :category

    # def race_name
    #     self.try(:race).try(:name)
    # end

    # def race_name=(race)
    #     race = Race.find_or_create_by(name: name)
    #     self.race = race
    # end

    def category_attributes=(attributes)
        if !attributes[:name].blank?
            self.category = Category.find_or_create_by(attributes)
        end
    end

    def race_attributes=(attributes)
        if !attributes[:name].blank?
            self.race = Race.find_or_create_by(attributes)
        end
    end
end
