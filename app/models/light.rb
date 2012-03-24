class Light < ActiveRecord::Base
  attr_accessible :x_position, :y_position, :z_position, :location_id, :light_id, :name, :content
end
