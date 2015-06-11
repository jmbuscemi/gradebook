class Parent < ActiveRecord::Base
  include User
  has_secure_password
  belongs_to :student

  validates :name, presence: true
  validates :email, presence: true

end
