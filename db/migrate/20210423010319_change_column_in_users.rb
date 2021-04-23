class ChangeColumnInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :password_disgest, :password_digest
  end
end
