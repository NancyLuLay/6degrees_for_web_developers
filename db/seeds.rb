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


# Users
# User.create(first_name:  "Example User",
#               last_name: "Example User",
#               location: "Vancouver",
#               current_position: "Web Developer",
#               current_company: "Company",
#              email: "example@railstutorial.org",
#              password:              "foobar",
#              password_confirmation: "foobar"
#              )

10.times do
  User.create(first_name:  Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              location: Faker::Address.city,
              current_position: "Web Developer",
              current_company: Faker::Company.name,
               email: Faker::Internet.email,
               password:              "password",
               password_confirmation: "password"
               )
end


# QUESTIONS_TO_CREATE = 500
#
# QUESTIONS_TO_CREATE.times do
#   Question.create title:      Faker::StarWars.quote,
#                   body:       Faker::Hipster.paragraph,
#                   view_count: rand(100)
