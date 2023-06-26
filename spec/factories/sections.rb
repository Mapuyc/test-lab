FactoryBot.define do
  factory :section do
    association :teacher
    association :subject
    association :classroom
    days { [association(:day)] }
    duration { [50, 80].sample }
    start_time { Faker::Time.between(from: '7:30 AM', to: '10:00 PM') }
    end_time { start_time + duration.minutes }
    
    transient do
      students_count { 0 }
    end
    
    after(:create) do |section, evaluator|
      create_list(:student, evaluator.students_count, sections: [section])
    end
  end
end