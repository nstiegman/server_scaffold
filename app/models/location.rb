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

  attr_accessor :photo_file_name
  attr_accessor :photo_content_type
  attr_accessor :photo_file_size
  attr_accessor :photo_updated_at
  attr_accessible :latitude, :longitude, :map, :name, :photo, :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at, :photo_url

  has_many :lights
  has_many :devices
  has_many :histories

  belongs_to :user

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :latitude, :presence => true

  validates :longitude, :presence => true

  #validates :map, :presence => true

  validates :name, :presence => true,
                   :length   => { :maximum => 30 }

#  validates :email, :presence => true,
#                    :format   => { :with => email_regex },
#                    :uniqueness => { :case_sensitive => false }

  has_attached_file :photo,
  :styles => {
    :thumb  => "100x100",
    :medium => "200x200",
    :large => "600x400"
  },
  :storage => :s3,
  :s3_credentials => Rails.root.join("config/s3.yml"),
  :path => ":attachment/:id/:style.:extension",
  :default_url => "/images/logo100.jpg",
  :bucket => 'bu-ece',
  :url => ':s3_domain_url',
  :s3_permissions => 'public-read',
  :s3_protocol => 'http'





    
  validates_attachment_content_type :photo, :content_type => [ 'image/jpeg', 'image/png', 'image/gif', 'image/jpg', 'image/bmp'  ], :message => "is not an acceptable image file" 



  def self.search(search)

    if search 
      find(:all, :conditions => ['name ILIKE?', "%#{search.downcase}%"])
    else
      find(:all)
    end
  end
  
  after_create :update_photo_url
  
  def update_photo_url
    self.photo_url = self.photo.url
    self.save!
  end 
  
end
