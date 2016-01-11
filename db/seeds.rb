# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "dropping data"
Booking.delete_all
Performance.delete_all
Genre.delete_all
Venue.delete_all
Show.delete_all
User.delete_all

puts "creating users"
u1 = User.create(email:"andy@example.com", password:"Password", username:"Andrew Insley")

puts "creating shows"
 s1 = Show.create(title:"Take That")
 puts "creating venues"
 v1 = Venue.create(name:"MEN Arena")
 puts "creating genre"
 g1 = Genre.create(name:"90's Pop")
 puts "creating performance"
p1 = Performance.create(show_id:s1.id, venue_id:v1.id, genre_id:g1.id)
  puts "creating booking"
Booking.create(performance_id:p1.id, user_id:u1.id, tickets:2)