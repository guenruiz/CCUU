class AddArtObjectsToArticle < ActiveRecord::Migration
  def change
    add_reference :art_objects, :article, index: true
  end
end
