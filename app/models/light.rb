class Light < ActiveRecord::Base
  attr_accessible :x_position, :y_position, :z_position, :location_id
  attr_accessible :light_id, :name, :content

  has_many :devices, :histories

  belongs_to :location
end
