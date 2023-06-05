# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


users = []
(1..30).each do |i|
  user = User.create!(
    email: Faker::Internet.email,
    username: Faker::Internet.username,
    password: 'password0@', # or use Faker::Internet.password to generate a random password
    password_confirmation: 'password0@',
    admin: false,
    id: i
  )
  users << user
end
(31..33).each do |i|
  User.create!(
    email: Faker::Internet.email,
    username: Faker::Internet.username,
    password: 'password0@', # or use Faker::Internet.password to generate a random password
    password_confirmation: 'password0@',
    admin: true,
    id: i
  )
end