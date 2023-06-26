class Enrollment < ApplicationRecord
  belongs_to :student
  belongs_to :section

  validate :validate_time_overlap

  private

  def validate_time_overlap
  	return unless section && student

    overlapping_sections = student.sections.joins(:days)
    									   .where('? BETWEEN start_time AND end_time OR ? BETWEEN start_time AND end_time', section.end_time, section.start_time)
                                           .where('days.id IN (?)', section.days.pluck(:id))

    errors.add(:base, "Time overlaps with an existing section") if overlapping_sections.exists?
  end
end
