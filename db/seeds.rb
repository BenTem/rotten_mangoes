# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# if Rails.env.development?
 
  users = []
  reviews = []
  movies = []

  100.times do |i|
    movies << Movie.create(
        title: Faker::Lorem.sentence,
        director: Faker::Name.name,
        runtime_in_minutes: Faker::Number.number(3),
        description: Faker::Lorem.sentence,             
        release_date: Faker::Date.forward(400),
    )
  end

  100.times do |i|
    users << User.create(
      email: Faker::Internet.email, 
      password: Faker::Internet.password(8, 20), 
      firstname: Faker::Name.first_name, 
      lastname: Faker::Name.last_name, 
      admin: false
      )
  end

  200.times do |i|
    reviews << Review.create(
        text: Faker::Lorem.paragraphs(3),
        user: users.first,
        movie: movies.first
    )
  end



 

 

 
# end