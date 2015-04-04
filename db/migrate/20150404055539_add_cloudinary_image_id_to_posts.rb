class AddCloudinaryImageIdToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :cloudinary_image_id, :string
  end
end
