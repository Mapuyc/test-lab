FactoryBot.define do
  factory :subject do
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
  end
end