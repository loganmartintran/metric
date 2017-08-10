# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#create 30 users
30.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

users = User.all

#create 10 registered apps
10.times do
  RegisteredApplication.create!(
    name: Faker::App.name,
    url: Faker::Internet.url,
    user: users.sample
  )
end

apps = RegisteredApplication.all

#create 20 events
20.times do
  Event.create!(
    name: Faker::Hacker.verb,
    registered_application: apps.sample
  )
end

puts "#{User.count} users created"
puts "#{RegisteredApplication.count} apps created"
puts "#{Event.count} events created"
