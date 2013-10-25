class CreateArtObjects < ActiveRecord::Migration
  def change
    create_table :art_objects do |t|
      t.string :route
      t.string :description

      t.timestamps
    end
  end
end
