class MakeCloudinaryImageIdNotNull < ActiveRecord::Migration
  def change
  	change_column :posts, :cloudinary_image_id, :string, null: false
  end
end
