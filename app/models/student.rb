class Student < ApplicationRecord
  has_many :sections, through: :enrollments
end
