class CreateHistories < ActiveRecord::Migration
  def self.up
    create_table :histories do |t|
      t.integer :light_id
      t.integer :device_id
      t.integer :location_id
      t.long :time

      t.timestamps
    end
  end

  def self.down
    drop_table :histories
  end
end
