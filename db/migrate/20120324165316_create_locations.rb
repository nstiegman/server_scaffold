class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.integer :location_id
      t.decimal :latitude
      t.decimal :longitude
      t.binary :map
      t.string :name
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
