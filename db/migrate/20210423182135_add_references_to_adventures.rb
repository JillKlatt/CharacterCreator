class AddReferencesToAdventures < ActiveRecord::Migration[6.1]
  def change
    add_reference :adventures, :character, foreign_key: true
    add_reference :adventures, :campaign, foreign_key: true
  end
end
