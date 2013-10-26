class User < ActiveRecord::Base
	has_many :articles
	validates :first_name, :presence => true
  	validates :last_name, :presence => true
  	validates :username, :presence => true
  	validates :password, :confirmation => true, :length => { :minimum => 6 }
  	validates :email, :format =>{ :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
