class CreateLights < ActiveRecord::Migration
  def self.up
    create_table :lights do |t|
      t.integer :x_position
      t.integer :y_position
      t.integer :z_position
      t.integer :location_id
      t.integer :light_id
      t.string :name
      t.binary :content

      t.timestamps
    end
  end

  def self.down
    drop_table :lights
  end
end
