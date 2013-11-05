class AddImagesToArticles < ActiveRecord::Migration
  def change
  	add_attachment :articles, :photo
  end
end
