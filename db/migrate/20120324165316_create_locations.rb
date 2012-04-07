class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.integer :location_id
      t.float :latitude
      t.float :longitude
      t.string :map
      t.string :name
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
