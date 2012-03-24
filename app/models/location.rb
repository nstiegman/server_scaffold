class Location < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :map, :name, :email

  has_many :lights, :devices, :histories

  belongs_to :user
end
