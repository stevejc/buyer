class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.text :address
      t.string :phone
      t.string :logo
      t.string :plan
      t.integer :primary_user

      t.timestamps
    end
  end
end
