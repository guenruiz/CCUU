class DropDatabase < ActiveRecord::Migration
  def change
  	drop_table :articles
  	drop_table :users
  	drop_table :sources
  end
end
