json.id enrollment.id
json.extract! enrollment.section, :id, :start_time, :end_time

json.teacher do
  json.id enrollment.section.teacher.id
  json.first_name enrollment.section.teacher.first_name
  json.last_name enrollment.section.teacher.last_name
end

json.subject do
  json.extract! enrollment.section.subject, :id, :name, :description, :created_at, :updated_at
  json.url subject_url(enrollment.section.subject, format: :json)
end

json.classroom do
  json.id enrollment.section.classroom.id
  json.name enrollment.section.classroom.name
end

json.days enrollment.section.days.pluck(:name)
json.url subject_url(enrolment.subject, format: :json)
