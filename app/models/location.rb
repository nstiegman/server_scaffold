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

class Location < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :map, :name

  has_many :lights
  has_many :devices
  has_many :histories

  belongs_to :user

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :latitude, :presence => true

  validates :longitude, :presence => true

  validates :map, :presence => true

  validates :name, :presence => true,
                   :length   => { :maximum => 30 }

#  validates :email, :presence => true,
#                    :format   => { :with => email_regex },
#                    :uniqueness => { :case_sensitive => false }

  def self.search(search)

    if search 
      find(:all, :conditions => ['name LIKE?', "%#{search.downcase}%"])
    else
      find(:all)
    end
  end
end
