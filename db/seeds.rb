# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
60.times do |n|
  user = User.last
  content = Faker::Books::Lovecraft.paragraph(sentence_count: 4)
  diary_date = Faker::Date.between(from: 120.days.ago, to: 60.days.ago)
  user.diaries.create(content: content,
                      activity: '1',
                      mood: '0',
                      appetite: '2',
                      diary_date: diary_date
                      )
end
