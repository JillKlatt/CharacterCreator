class CreateWeapons < ActiveRecord::Migration[6.1]
  def change
    create_table :weapons do |t|
      t.string :name
      t.text :description
      t.string :damage
      t.belongs_to :character # , foreign_key: {on_delete: :cascade} (will destroy/delete nested objects)

      t.timestamps
    end
  end
end
