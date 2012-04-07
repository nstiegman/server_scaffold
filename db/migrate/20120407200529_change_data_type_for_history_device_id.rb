class ChangeDataTypeForHistoryDeviceId < ActiveRecord::Migration
  def self.up
    change_table :histories do |t|
      t.change :device_id, :string
    end
  end

  def self.down
    change_table :histories do |t|
      t.change :device_id, :integer
    end
  end
end
