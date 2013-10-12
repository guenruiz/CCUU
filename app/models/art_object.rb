class ArtObject < ActiveRecord::Base
  belongs_to :article
  validates :url, :format =>{ :with => /https?:\/\/[\S]+/} 
  validates :description, :presence => true
end
