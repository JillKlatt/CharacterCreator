class RemoveAdventureIdFromCampaign < ActiveRecord::Migration[6.1]
  def change
    remove_column :campaigns, :adventure_id
    add_reference :campaigns, :user, foreign_key: true
  end
end
