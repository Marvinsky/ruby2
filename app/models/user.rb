class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :articles
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include PermissionsConcern

  def avatar
  	# include MD5 gem, should be part of standard ruby install
	#require 'digest/md5'
 
	# get the email from URL-parameters or what have you and make lowercase
	email_address = self.email.downcase
 
	# create the md5 hash
	hash = Digest::MD5.hexdigest(email_address)
 
	# compile URL which can be used in <img src="RIGHT_HERE"...
	image_src = "http://www.gravatar.com/avatar/#{hash}"
  end

end
