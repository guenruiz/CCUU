class AddArticlesToUser < ActiveRecord::Migration
  def change
  	add_reference :articles, :user, index: true
  end
end

