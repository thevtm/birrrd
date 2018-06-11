# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_guy = User.create!(name: "Guy", email: "guy@gmail.com", password: "111111", password_confirmation: "111111")
user_rob = User.create!(name: "Rob", email: "groy@gmail.com", password: "222222", password_confirmation: "222222")

bird_birdy = Bird.create!(user: user_guy, name: "Birdy", location: "Moscow", price: 10)

Rental.create!(user: user_rob, bird: bird_birdy, start_date: Date.new(2010, 1, 1), end_date: Date.new(2010, 2, 1), status: 0)
