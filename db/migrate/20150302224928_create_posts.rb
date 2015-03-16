class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :author, index: true, null: false
      t.boolean :anonymous, default: false
      t.string :text, null: false, default: ''

      t.timestamps null: false
    end
  end
end
