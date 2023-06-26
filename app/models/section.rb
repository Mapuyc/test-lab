class Section < ApplicationRecord
  belongs_to :teacher
  belongs_to :subject
  belongs_to :classroom
  has_many :enrollments
  has_and_belongs_to_many :days
  has_many :students, through: :enrollments
end
