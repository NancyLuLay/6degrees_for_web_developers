# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ALMA_MATERS = ["Langara", "OCAD", "UW", "UWO", "UBC"]
#
# ALMA_MATERS.each {|am| Tag.add_anonymous_tag(am, "alma_mater")}

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

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
