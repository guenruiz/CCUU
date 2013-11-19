class ArtObject < ActiveRecord::Base
  belongs_to :article
  #validates :name, :presence => true
  #validates :route, :format =>{ :with => /https?:\/\/[\S]+/} 
  #validates :description, :presence => true
end
