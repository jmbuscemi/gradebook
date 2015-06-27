class Parent < ActiveRecord::Base
  has_secure_password
  belongs_to :student

  validates :name, presence: true
  validates :email, presence: true

end
