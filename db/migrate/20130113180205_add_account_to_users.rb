class AddAccountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :account_id, :integer
    add_column :users, :is_primary, :boolean
  end
end
