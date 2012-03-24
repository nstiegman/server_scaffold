# == Schema Information
#
# Table name: locations
#
#  id          :integer         not null, primary key
#  location_id :integer
#  latitude    :decimal(, )
#  longitude   :decimal(, )
#  map         :binary
#  name        :string(255)
#  email       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Location do
  pending "add some examples to (or delete) #{__FILE__}"
end
