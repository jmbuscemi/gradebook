class Student < ActiveRecord::Base
  include User
  has_secure_password
  has_many :parents
  belongs_to :teacher
  has_many :grades

  validates :name, presence: true
  validates :email, presence: true

end
