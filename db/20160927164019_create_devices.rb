class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.column :vendor_id, :integer
      t.timestamps null: false
    end
  end
end
