# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 10.times do
#   User.create(first_name:  Faker::Name.first_name,
#               last_name: Faker::Name.last_name,
#               location: Faker::Address.city,
#               current_position: "Web Developer",
#               current_company: Faker::Company.name,
#                email: Faker::Internet.email,
#                password:              "password",
#                password_confirmation: "password"
#                )
# end

# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

# # Posts
# users = User.order(:created_at).take(6)
# 30.times do
#   post_title = Faker::Lorem.sentence(1)
# 	post_body = Faker::Lorem.sentence(5)
#   users.each { |user| user.posts.create!(post_title: post_title, post_body: post_body) }
# end
#
# # Following relationships
# users = User.all
# user  = users.first
# following = users[2..30]
# followers = users[3..30]
# following.each { |followed| user.follow(followed) }
# followers.each { |follower| follower.follow(user) }
