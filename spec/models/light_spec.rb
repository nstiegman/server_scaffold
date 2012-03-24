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

require 'spec_helper'

describe Light do
  pending "add some examples to (or delete) #{__FILE__}"
end
