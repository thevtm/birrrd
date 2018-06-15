Rental.delete_all
Review.delete_all
Bird.delete_all
User.delete_all

5.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "111111",
    password_confirmation: "111111"
  )
end

100.times do
  bird = Bird.new(
    user: User.all.sample,
    name: Faker::Dog.name,
    location: Faker::Address.country,
    price: Faker::Number.between(1, 100),
    description: Faker::Lorem.paragraph(7, true, 2)
  )

  bird.remote_photo_url = "http://loremflickr.com/720/486/bird"
  bird.save!
end

20.times do
  Rental.create!(
    user: User.all.sample,
    bird: Bird.all.sample,
    start_date: Date.new(2010, 1, 1),
    end_date: Date.new(2010, 2, 1)
  )
end

40.times do
  Review.create!(
    user: User.all.sample,
    bird: Bird.all.sample,
    title: Faker::Lorem.sentence(3),
    content: Faker::Lorem.paragraph(5, true, 2)
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

test_bird_a = Bird.new(
  user: test_user_a,
  name: "Test Bird A",
  location: "Havana Cuba",
  price: 1,
  description: Faker::Lorem.paragraph(7, true, 2)
)
test_bird_a.remote_photo_url = "http://loremflickr.com/720/486/bird"
test_bird_a.save!

Rental.create!(
  user: test_user_b,
  bird: test_bird_a,
  start_date: Date.new(2018, 6, 1),
  end_date: Date.new(2018, 7, 1)
)
