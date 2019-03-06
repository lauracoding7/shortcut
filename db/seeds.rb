# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Destroying existing db records'
Message.destroy_all
Review.destroy_all
Appointment.destroy_all
Service.destroy_all
User.destroy_all
puts 'Done!'

puts 'Creating users'
filo = User.create!(email: 'fitog4@hotmail.it', password: 'secret', name: 'Filo')

ivan = User.create!(email: 'ivan@mail.com', password: 'secret', name: 'Ivan', host_service_address: 'Amsterdam Transvaalstraat 17', host_service_latitude: 52.3554425, host_service_longitude: 4.9270905)

isaac = User.create!(email: 'isaac@mail.com', password: 'secret', name: 'Isaac', host_service_address: 'Rotterdam Centraal, Stationshal, 3013 AL Rotterdam, Netherlands', host_service_latitude: 51.9239359, host_service_longitude: 4.4696361)

fred = User.create!(email: 'fred@mail.com', password: 'secret', name: 'Fred', commute_area_address: 'A-Lab Amsterdam', commute_area_longitude: 4.88969, commute_area_latitude: 52.37403, commute_area_radius: 10, commute_price: 5)

tom = User.create!(email: 'tom@mail.com', password: 'secret', name: 'Tom', commute_area_address: 'Amsterdam Rokin', commute_area_longitude: 4.8927669, commute_area_latitude: 52.368404, commute_area_radius: 5, commute_price: 7, host_service_address: 'Amsterdam, Ingogostraat 14', host_service_latitude: 52.355207, host_service_longitude: 4.9259661)
puts 'Done!'

puts 'Creating services'
haircut = Service.new(title: 'Haircut', description: "It's a haircut.", duration: 40, price: 15)
haircut.barber = tom
haircut.save!

haircut1 = Service.new(title: 'Haircut', description: "It's a cheap haircut.", duration: 30, price: 10)
haircut1.barber = fred
haircut1.save!

haircut2 = Service.new(title: 'Haircut', description: "It's a great haircut.", duration: 50, price: 45)
haircut2.barber = isaac
haircut2.save!

beard = Service.new(title: 'Beard trim', description: "It's a beard trim.", duration: 25, price: 10)
beard.barber = tom
beard.save!

beard1 = Service.new(title: 'Amazing beard trim', description: "It's an amazing beard trim.", duration: 50, price: 100)
beard1.barber = ivan
beard1.save!
puts 'Done!'

puts 'Creating appointments'
appt = Appointment.new(location_address: 'Ingogostraat 14D, Amsterdam', location_longitude: 4.9257856, location_latitude: 52.3552398, datetime: Time.new(2019, 3, 31, 19, 0, 0, "+01:00"))
appt.service = haircut1
appt.barber = appt.service.barber
appt.client = filo
appt.save!

appt1 = Appointment.new(location_address: 'Amsterdam Transvaalstraat 17', location_latitude: 52.3554425, location_longitude: 4.9270905, datetime: Time.new(2019, 3, 7, 14, 0, 0, "+01:00"))
appt1.service = beard1
appt1.barber = appt1.service.barber
appt1.client = filo
appt1.save!
puts 'Done!'


