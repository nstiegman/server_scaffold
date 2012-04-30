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

require 'spec_helper'

describe Device do
  pending "add some examples to (or delete) #{__FILE__}"
end

