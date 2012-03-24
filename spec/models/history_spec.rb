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

require 'spec_helper'

describe History do
  pending "add some examples to (or delete) #{__FILE__}"
end
