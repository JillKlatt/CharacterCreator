class Campaign < ApplicationRecord
    has_many :adventures
    has_many :characters, through: :adventures
    #belongs_to :user, optional: true

    accepts_nested_attributes_for :characters

    def adventure_admin=(adventure_id)
        adventure = Adventure.find_by(id: adventure_id) 
        self.adventures.update_all(role: false)
        adventure.role = true
        adventure.save
    end

    def find_dm
        #binding.pry
        self.adventures.each do |adventure|
            if adventure.role == true
            @found_character_id = adventure.character_id
            end
        end
        @dm = Character.find_by(id: @found_character_id)
        @dm.name
    end

end
