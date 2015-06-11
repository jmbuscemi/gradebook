class Grade < ActiveRecord::Base
  belongs_to :student

  validates :grade, presence: true
  validates :assignment_name, presence: true

end
