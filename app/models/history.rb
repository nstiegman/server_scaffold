class History < ActiveRecord::Base
  belongs_to :location, :light, :device
end
