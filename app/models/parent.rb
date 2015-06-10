class Parent < ActiveRecord::Base
  include User
  has_secure_password
  belongs_to :student
end
