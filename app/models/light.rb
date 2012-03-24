# == Schema Information
#
# Table name: lights
#
#  id          :integer         not null, primary key
#  x_position  :integer
#  y_position  :integer
#  z_position  :integer
#  location_id :integer
#  light_id    :integer
#  name        :string(255)
#  content     :binary
#  created_at  :datetime
#  updated_at  :datetime
#

class Light < ActiveRecord::Base
  attr_accessible :x_position, :y_position, :z_position, :location_id
  attr_accessible :light_id, :name, :content

  has_many :devices
  has_many :history

  belongs_to :location

  validates :x_position, :presence => true

  validates :y_position, :presence => true

  validates :z_position, :presence => true

  validates :location_id, :presence => true

  validates :light_id, :presence => true

  validates :name, :presence => true
                   :length   => { :maximum => 50 }

end
