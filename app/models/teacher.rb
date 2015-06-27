class Teacher < ActiveRecord::Base
  has_secure_password

  has_many :students
  accepts_nested_attributes_for :students

  validates :name, presence: true
  validates :email, presence: true

end
