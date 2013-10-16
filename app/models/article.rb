class Article < ActiveRecord::Base
  belongs_to :user
  has_many :sources
  has_many :art_objects
  validates :title, :presence => true
  validates :body, :presence => true
  
  #public Integer id;
  #public String title;
  #public String body;
end
