# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."

Instrument.destroy_all
# Booking.destroy_all
# User.destroy_all
# Review.destroy_all

puts "Creating instruments..."

maria = User.create(email:"weber-maria@outlook.com",
                    password:"123456")

guitar = Instrument.create(user_id: maria.id,
                           name: 'Guitar',
                           description: 'Great acoustic guitar',
                           price_per_day: 10)

piano = Instrument.create(user_id: maria.id,
                          name: 'Piano',
                          description: 'Yamaha brand',
                          price_per_day: 30)

violin = Instrument.create(user_id: maria.id,
                           name: 'Violin',
                           description: 'Unique old style instrument',
                           price_per_day: 25)

harp = Instrument.create(user_id: maria.id,
                         name: 'Harp',
                         description: 'Sounds like an angel',
                         price_per_day: 20)

bagpipes = Instrument.create(user_id: maria.id,
                             name: 'Bagpipes',
                             description: 'Kilt is not included',
                             price_per_day: 15)

puts "Successfully created"
