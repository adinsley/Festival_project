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

puts "creating users" "2016-02-01 09:00"
u1 = User.create(email:"andy@example.com", password:"Password", username:"Andrew Insley")

puts "creating shows"
 s1 = Show.create(title:"Take That")
 puts "creating venues"
 v1 = Venue.create(name:"MEN Arena", loaction:"Manchester M1 6LL", description: "The Manchester Arena is an indoor arena in Hunts Bank, Manchester, England. Situated immediately north of the city centre, most of the arena is situated above Manchester Victoria station in air rights space. The arena has the highest seating capacity of any indoor venue in the United Kingdom, and fourth largest in the European Union with a capacity of 21,000 and is one of the world's busiest indoor arenas, hosting music and sporting events such as boxing and swimming. The arena was a key part of Manchester's bids to host the Olympic Games in 1996 and 2000 and was eventually used for the 2002 Commonwealth Games." )
 puts "creating genre"
 g1 = Genre.create(name:"90's Pop")
 puts "creating Performance"
 # p1 = Performance.create(venue_id:v1.id, start:"2016-02-01 09:00", finish: "2016-02-01 10:00")
 # p1 = Performance.create(venue_id:v1.id, start:"2016-02-01 11:00", finish: "2016-02-01 12:00")

 
