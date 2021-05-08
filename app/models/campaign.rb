class Campaign < ApplicationRecord
    has_many :adventures
    has_many :characters, through: :adventures
    validates :name, presence: true
    #belongs_to :user, optional: true

    # accepts_nested_attributes_for :characters

    def adventure_admin=(adventure_id)
        adventure = Adventure.find_by(id: adventure_id) 
        self.adventures.update_all(role: false)
        adventure.role = true
        adventure.save
    end


end
