class ChangeCampaignScheduleToString < ActiveRecord::Migration[6.1]
  def change
    remove_column :campaigns, :schedule 
    add_column :campaigns, :schedule, :string 
    add_column :campaigns, :description, :text
  end
end
