class Article < ActiveRecord::Base
	has_many :art_objects
	validates :title, :presence => true
  	validates :body, :presence => true
end
