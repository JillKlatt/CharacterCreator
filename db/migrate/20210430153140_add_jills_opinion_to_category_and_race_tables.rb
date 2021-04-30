class AddJillsOpinionToCategoryAndRaceTables < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :jills_opinion, :string
    add_column :races, :jills_opinion, :string
  end
end
