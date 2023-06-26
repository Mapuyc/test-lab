Rails.logger = Logger.new(STDOUT)
Rake::Task['db:fixtures:load'].invoke

days_of_week = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]

days_of_week.each do |day|
  Day.find_or_create_by(name: day)
end

10.times do
  FactoryBot.create(:section, days: Day.where(name: %w[Monday Wednesday Friday]))
end

10.times do
  FactoryBot.create(:section, days: Day.where(name: %w[Thursday Thursday]))
end

10.times do
  FactoryBot.create(:section, days: Day.where(name: %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]))
end

FactoryBot.create(:student)