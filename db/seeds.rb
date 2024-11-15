# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

10.times do
  plan = WeeklyPlan.create(week: Faker::Date.between(from: 1.year.ago, to: Date.today), category: WeeklyPlan.categories.keys.sample, goal: Faker::Lorem.sentence)

  5.times do
    task = plan.tasks.create(title: Faker::Lorem.word, description: Faker::Lorem.sentence)
    3.times { task.sub_tasks.create(title: Faker::Lorem.word) }
  end

  plan.notes.create(content: Faker::Lorem.paragraph)
end

