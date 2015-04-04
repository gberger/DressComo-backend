class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"

  acts_as_votable

  default_scope { order('created_at DESC') }
end
