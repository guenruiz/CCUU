class Article < ActiveRecord::Base
	has_many :art_objects
	validates :title, :presence => true
  	validates :body, :presence => true
  	has_attached_file :photo, :styles => { :large => "720x720", :medium => "300x300>", :thumb => "100x100>" }
end
