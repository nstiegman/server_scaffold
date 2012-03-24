class Location < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :map, :name, :email
end
