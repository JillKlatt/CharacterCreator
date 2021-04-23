class AddReferencesToCampaigns2 < ActiveRecord::Migration[6.1]
    def change
      add_reference :campaigns, :adventure, foreign_key: true
    end
  end