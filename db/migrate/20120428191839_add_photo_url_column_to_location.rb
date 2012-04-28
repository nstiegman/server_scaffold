class AddPhotoUrlColumnToLocation < ActiveRecord::Migration
  def self.up
      add_column :locations, :photo_url,          :string
  end

  def self.down
      remove_column :locations, :photo_url
  end
end
