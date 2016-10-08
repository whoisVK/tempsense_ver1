class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.column :user_id, :integer
      t.timestamps null: false
    end
  end
end
