class ChangeUsernameToNotNull < ActiveRecord::Migration
  def change
  	change_column :users, :username, :string, null: false, limit: 20
  end
end
