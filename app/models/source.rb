class Source < ActiveRecord::Base
  belongs_to :article
  validates :name,:presence => { :message => "No debe ir en blanco" }
  validates :url, :format =>{ :with => /https?:\/\/[\S]+/, :message=>"Formato de url inválido" } 
  #validates :description, :presence => true
end
