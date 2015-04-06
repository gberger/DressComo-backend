class User < ActiveRecord::Base
  acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable


  acts_as_voter

  validates :email, uniqueness: true, presence: true, 
  					format: { message: "must be a valid email", with: /[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}/}
  validates :username, uniqueness: true, presence: true, length: { in: 2..20 },
  					format: { message: "must only contain letters, numbers, dots and underscore", with: /\A[a-zA-Z0-9_\.]+\z/ }
  validates :name, length: {maximum: 128}
  validates :location, length: {maximum: 128}
  validates :bio, length: {maximum: 512}

end
