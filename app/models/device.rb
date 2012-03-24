class Device < ActiveRecord::Base
  attr_accessible :device_id

  has_many :histories

  belongs_to :light, :location
end
