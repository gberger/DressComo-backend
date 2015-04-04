class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"

  default_scope { order('created_at DESC') }
end
