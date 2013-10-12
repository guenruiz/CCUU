class AddSourcesToArticle < ActiveRecord::Migration
  def change
    add_reference :sources, :article, index: true
  end
end
