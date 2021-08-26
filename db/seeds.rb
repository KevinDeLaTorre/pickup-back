# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create a main sample user
User.create!(
  name:  "Kevin",
  email: "kevin@example.com"
)

# Create events
50.times do |event|
  title      = Faker::Hobby.activity
  text       = Faker::Hipster.sentence(word_count: 15, random_words_to_add: 15)
  people     = Faker::Name.name
  location   = Faker::Address.full_address
  date       = Faker::Date.forward(days: 100)
  start_time = Faker::Time.between_dates(from: date, to: date, period: :morning )
  end_time   = Faker::Time.between( from: start_time, to: start_time + 5 )
  Event.create(
    title: title,
    description: text,
    people: people,
    location: location,
    date: date,
    start_time: start_time,
    end_time: end_time
  )
end
