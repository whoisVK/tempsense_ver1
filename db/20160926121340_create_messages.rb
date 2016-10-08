class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.column :temperature, :integer
      t.column :device_id, :integer
      t.timestamps null: false
    end
  end
end
