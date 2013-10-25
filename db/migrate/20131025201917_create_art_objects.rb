class CreateArtObjects < ActiveRecord::Migration
  def change
    create_table :art_objects do |t|
      t.string :name
      t.string :description
      t.string :route

      t.timestamps
    end
  end
end
