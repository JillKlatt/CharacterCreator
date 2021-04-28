class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def find_dm
    self.adventures.each do |adventure|
        if adventure.role == true
        @found_character = adventure.character_id
        end
    @dm = Character.find_by(id: @found_character)
    end
end
end
