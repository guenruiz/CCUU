class User < ActiveRecord::Base
	before_save :encrypt_password

	has_many :articles
	validates :first_name, :presence => { :message => "Falta tu nombre" }
  	validates :last_name, :presence => { :message => "Faltan tus apellidos" }
  	validates :username, :presence => { :message => "Necesitamos tu usuario" }
  	validates :password, :presence => true, :on => :create,  :length => { :minimum => 6 }
  	validates_confirmation_of :password
  	validates :email, :format =>{ :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  	has_attached_file :photo, :styles => { :large => "720x720", :medium => "300x300>", :thumb => "128x128>" }


  	def self.authenticate(username,password)
  		user = find_by_username(username)
  		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end

	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
		end
	end
end
