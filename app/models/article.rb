class Article < ActiveRecord::Base
	
	has_many :art_objects, :dependent => :destroy
  	accepts_nested_attributes_for :art_objects, allow_destroy: true, reject_if: :all_blank

	has_many :sources, :dependent => :destroy
	accepts_nested_attributes_for :sources, allow_destroy: true,  reject_if: :all_blank

	belongs_to :user

	validates :title, :presence => { :message => "Falta el título" }
  	validates :body, :presence => { :message => "Falta el Cuerpo del artículo" }
  	has_attached_file :photo, :styles => { :large => "720x720", :medium => "300x300>", :thumb => "128x128>" },
  					  :default_url => "http://bootply.com/assets/example/bg_suburb.jpg"

end
