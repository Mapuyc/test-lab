FactoryBot.define do
  factory :day do
    name { %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday].sample }
  end
end
