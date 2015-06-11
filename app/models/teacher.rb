class Teacher < ActiveRecord::Base
  include User
  has_secure_password
  has_many :students

  validates :name, presence: true
  validates :email, presence: true

end
