class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :account_id, "bigint unsigned"
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
