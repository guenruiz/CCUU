class AddUsernameAndPasswordToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :password, :string
  end
end
