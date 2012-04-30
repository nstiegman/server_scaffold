# == Schema Information
#
# Table name: locations
#
#  id                 :integer         not null, primary key
#  location_id        :integer
#  latitude           :decimal(, )
#  longitude          :decimal(, )
#  map                :string(255)
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  photo_url          :string(255)
#

require 'spec_helper'

describe Location do
  pending "add some examples to (or delete) #{__FILE__}"
end


