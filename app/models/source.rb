class Source < ActiveRecord::Base
  belongs_to :article
  validates :title, :presence => true
  validates :url, :format =>{ :with => /https?:\/\/[\S]+/} 
end
