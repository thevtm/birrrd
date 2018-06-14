# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "111111",
    password_confirmation: "111111"
  )
end

30.times do
  Bird.create!(
    user: User.all.sample,
    name: Faker::Dog.name,
    location: Faker::StarWars.planet,
    price: Faker::Number.between(1, 100)
  )
end

80.times do
  Rental.create!(
    user: User.all.sample,
    bird: Bird.all.sample,
    start_date: Date.new(2010, 1, 1),
    end_date: Date.new(2010, 2, 1),
    status: 0
  )
end

# Test Users
test_user_a = User.create!(
  name: "Test A",
  email: "a@a.a",
  password: "111111",
  password_confirmation: "111111"
)

test_user_b = User.create!(
  name: "Test B",
  email: "b@b.b",
  password: "111111",
  password_confirmation: "111111"
)

test_bird_a = Bird.create!(
  user: test_user_a,
  name: "Test Bird A",
  location: "Havana Cuba",
  price: 1,
)

Rental.create!(
  user: test_user_b,
  bird: test_bird_a,
  start_date: Date.new(2010, 1, 1),
  end_date: Date.new(2010, 2, 1),
  status: 0
)
