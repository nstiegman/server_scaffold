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

class Location < ActiveRecord::Base

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
  :storage => :s3,
  :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
  :path => ":attachment/:id/:style.:extension",
  :bucket => 'bu-ece',
  :url => ':s3_domain_url',
  :s3_permissions => 'public-read',
  :s3_protocol => 'http',
  :styles => {
    :thumb  => "100x100",
    :medium => "200x200",
    :large => "600x400"
  },
  :default_url => "/images/nomap.bmp"


  after_create :update_photo_url


    
  validates_attachment_content_type :photo, :content_type => [ 'image/jpeg', 'image/png', 'image/gif', 'image/jpg', 'image/bmp'  ], :message => "is not an acceptable image file" 



  def self.search(search)

    if search 
      find(:all, :conditions => ['name ILIKE?', "%#{search.downcase}%"])
    else
      find(:all)
    end
  end
  
  
  
  def update_photo_url
    self.photo_url = self.photo.url(:original)
    self.save!
  end 
  
end


