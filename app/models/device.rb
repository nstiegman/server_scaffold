# == Schema Information
#
# Table name: devices
#
#  id          :integer         not null, primary key
#  device_id   :string(255)
#  location_id :integer
#  light_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Device < ActiveRecord::Base
  attr_accessible :device_id

  has_many :histories

  belongs_to :light
  belongs_to :location

#  validates :device_id, :presence => true

#  validates :location, :presence => true

end
