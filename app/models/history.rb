# == Schema Information
#
# Table name: histories
#
#  id          :integer         not null, primary key
#  light_id    :integer
#  device_id   :integer
#  location_id :integer
#  time        :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

class History < ActiveRecord::Base
  belongs_to :location
  belongs_to :light
  belongs_to :device

  validates :device_id, :presence => true

  validates :location_id, :presence => true

  validates :time, :presence => true

end
