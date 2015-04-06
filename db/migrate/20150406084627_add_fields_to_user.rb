class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, limit: 20
    add_column :users, :name,     :string, limit: 128
    add_column :users, :location, :string, limit: 128
    add_column :users, :bio,      :string, limit: 512

  	add_index :users, :username, unique: true
  end
end
