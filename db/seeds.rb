# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.create(email: 'test@test.com', password: 'password', password_confirmation: 'password')

4.times do |user|
  User.create(email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
end

puts "5 users created."

Category.create(name: 'Art')
Category.create(name: 'Sports')
Category.create(name: 'Technology')

50.times do |book|
  Book.create(title: Faker::Book.title,
              author_name: Faker::Book.author,
              publisher_name: Faker::Book.publisher,
              description: Faker::Lorem.paragraph(2, true),
              unit_price: Faker::Number.decimal(2),
              category_id: Random.new.rand(1..3))
end

puts "50 books created."
