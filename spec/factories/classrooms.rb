FactoryBot.define do
  factory :classroom do
    name { Faker::Educator.unique.course_name }
  end
end
