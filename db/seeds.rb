# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  user = User.last
  diary_date_array = (Date.parse('2019-10-01')..Date.parse('2020-02-28')).to_a

  diary_date_array.each do |diary_date|
    content = Faker::Books::Lovecraft.paragraph(sentence_count: 4)
    user.diaries.create(content: content,
                        activity: [-2, -1, 0, 1, 2].sample,
                        mood: [-2, -1, 0, 1, 2].sample,
                        appetite: [-2, -1, 0, 1, 2].sample,
                        diary_date: diary_date
                        )
  end
