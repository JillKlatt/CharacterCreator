class AddWeaponsCharactersJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :character_weapons do |t|

      t.text :notes

      t.timestamps
    end
  end
end
