class AddRoleToAdventures < ActiveRecord::Migration[6.1]
  def change
    add_column :adventures, :role, :boolean
  end
end
