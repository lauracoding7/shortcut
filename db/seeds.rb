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

ivan = User.create!(email: 'ivan@mail.com', password: 'secret', name: 'Ivan', host_service_address: 'Amsterdam Transvaalstraat 17')

isaac = User.create!(email: 'isaac@mail.com', password: 'secret', name: 'Isaac', host_service_address: 'Rotterdam Centraal, Stationshal, 3013 AL Rotterdam, Netherlands')

fred = User.create!(email: 'fred@mail.com', password: 'secret', name: 'Fred', commute_area_address: 'Amsterdam mercatorplein', commute_area_radius: 10, commute_price: 5)

tom = User.create!(email: 'tom@mail.com', password: 'secret', name: 'Tom', commute_area_address: 'Amsterdam Rokin', commute_area_radius: 5, commute_price: 7, host_service_address: 'Amsterdam, Ingogostraat 14')

Faker::Config.random = Random.new(1)
amsterdam_addresses = ['Van Diemenstraat 408 Amsterdam, Netherlands', 'Barentszstraat 171 Amsterdam, Netherlands', 'Gedempt Hamerkanaal 201 Amsterdam, Netherlands', 'Goudsbloemstraat 91 Amsterdam, Netherlands', 'Lindengracht 90 Amsterdam, Netherlands', 'Lindengracht 75 Amsterdam, Netherlands', 'Prinsenstraat 22 Amsterdam, Netherlands', 'De Ruijterkade 128 Amsterdam, Netherlands', 'Herengracht 90 Amsterdam, Netherlands', 'Lijnbaanssteeg 5-7 Amsterdam, Netherlands', 'Westermarkt 11 Amsterdam, Netherlands', 'Singel 210 Amsterdam, Netherlands', 'Nieuwezijds Voorburgwal 200 Amsterdam, Netherlands', 'Gasthuismolensteeg 5HS Amsterdam, Netherlands', 'Oudezijds Voorburgwal 177-179 Amsterdam, Netherlands', 'Peperstraat 10 Amsterdam, Netherlands', 'Marnixstraat 192B Amsterdam, Netherlands', 'Bellamyplein 51 Amsterdam, Netherlands', 'Funenkade 7 Amsterdam, Netherlands', 'Amstel 212 Amsterdam, Netherlands', 'Utrechtsestraat 6 Amsterdam, Netherlands', 'Leidsestraat 94 Amsterdam, Netherlands', 'Herengracht 542-556 Amsterdam, Netherlands', 'Utrechtsestraat 109-111 Amsterdam, Netherlands', 'Vijzelgracht 15 Amsterdam, Netherlands', 'Museumstraat 1 Amsterdam, Netherlands', 'Frans Halsstraat 28 Amsterdam, Netherlands', 'Gerard Doustraat 98 Amsterdam, Netherlands', 'Albert Cuypstraat 58-60 Amsterdam, Netherlands', 'Tweede van der Helststraat 3 Amsterdam, Netherlands']
10.times do
  User.create!(email: Faker::Internet.unique.email, password: 'secret', name: Faker::Name.name, host_service_address: amsterdam_addresses[Faker::Number.unique.within(0..29)])
end
10.times do
  User.create!(email: Faker::Internet.unique.email, password: 'secret', name: Faker::Name.name, commute_area_address: amsterdam_addresses[Faker::Number.unique.within(0..29)], commute_area_radius: (1..10).to_a[Faker::Number.within(0..9)], commute_price: (1..10).to_a[Faker::Number.within(0..9)])
end
5.times do
  User.create!(email: Faker::Internet.unique.email, password: 'secret', name: Faker::Name.name, commute_area_address: amsterdam_addresses[Faker::Number.unique.within(0..29)], commute_area_radius: (1..10).to_a[Faker::Number.within(0..9)], commute_price: (1..10).to_a[Faker::Number.within(0..9)], host_service_address: amsterdam_addresses[Faker::Number.unique.within(0..29)])
end
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

puts 'Creating reviews'
ivan_review1 = Review.new(content: 'Amazing beard trimmer!', rating: 5, barber_review: true)
ivan_review1.receiver = ivan
ivan_review1.author = isaac
ivan_review1.save!

ivan_review2 = Review.new(content: 'Incredible beard trimmer!', rating: 4, barber_review: true)
ivan_review2.receiver = ivan
ivan_review2.author = fred
ivan_review2.save!

ivan_review3 = Review.new(content: 'Unbelievable beard trimmer!', rating: 5, barber_review: true)
ivan_review3.receiver = ivan
ivan_review3.author = tom
ivan_review3.save!

fred_review1 = Review.new(content: 'I got a nice haircut ;)', rating: 4, barber_review: true)
fred_review1.receiver = fred
fred_review1.author = tom
fred_review1.save!

fred_review2 = Review.new(content: 'Meh...', rating: 2, barber_review: true)
fred_review2.receiver = fred
fred_review2.author = isaac
fred_review2.save!

fred_review3 = Review.new(content: 'I LOOK LIKE A GOD! Thanks man!', rating: 5, barber_review: true)
fred_review3.receiver = fred
fred_review3.author = ivan
fred_review3.save!

filo_review = Review.new(content: 'Filo is a nice guy to have a chat with, his apartment does not smell bad and he seem to shower regularly, judging from his incredibly silky hair...', rating: 5, barber_review: false)
filo_review.receiver = filo
filo_review.author = fred
filo_review.save!
puts 'Done!'

puts 'Creating messages'
message = Message.new(content: 'Hi beardlova, remember where my house is right?')
message.appointment = appt1
message.author = ivan
message.receiver = filo
message.save!
puts 'Done!'
