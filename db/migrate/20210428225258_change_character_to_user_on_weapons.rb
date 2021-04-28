class ChangeCharacterToUserOnWeapons < ActiveRecord::Migration[6.1]
  def change
    remove_column :weapons, :character_id 
    add_reference :weapons, :user, foreign_key: true
  end
end
