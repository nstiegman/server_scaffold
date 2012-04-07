class ChangeDataTypeForLocationMap < ActiveRecord::Migration
  def self.up
    change_table :locations do |t|
      t.change :map, :string
    end
  end

  def self.down
    change_table :locations do |t|
      t.change :map, :binary
    end
  end
end
