# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Faker::Config.random = Random.new(1)

puts 'Destroying existing db records'
Message.destroy_all
Review.destroy_all
Appointment.destroy_all
Service.destroy_all
ImageUrl.destroy_all
User.destroy_all
puts 'Done!'

puts 'Creating users'
killian = User.create!(email: "killian@gmail.com", password: "secret", name: "Killian", avatar_url: "killian.jpg")

rebekah = User.create!(email: "rebekah@gmail.com", password: "secret", name: "Rebekah Kohler IV", host_service_address: "Keizersgracht 580, 1017 EN Amsterdam", commute_area_address: 'Keizersgracht 580, 1017 EN Amsterdam', commute_area_radius: 10, avatar_url: "pictures/women/img13.jpg")

ivan = User.create!(email: 'ivan@mail.com', password: 'secret', name: 'Ivan', host_service_address: 'Amsterdam Transvaalstraat 17', avatar_url: 'pictures/men/img2.jpg')

isaac = User.create!(email: 'isaac@mail.com', password: 'secret', name: 'Isaac', host_service_address: 'Rotterdam Centraal, Stationshal, 3013 AL Rotterdam, Netherlands', avatar_url: 'pictures/men/img3.jpg')

fred = User.create!(email: 'fred@mail.com', password: 'secret', name: 'Fred', commute_area_address: 'Amsterdam mercatorplein', commute_area_radius: 10, commute_price: 5, avatar_url: 'pictures/men/img4.jpg')

tom = User.create!(email: 'tom@mail.com', password: 'secret', name: 'Tom', commute_area_address: 'Amsterdam Rokin', commute_area_radius: 5, commute_price: 7, host_service_address: 'Amsterdam, Ingogostraat 14', avatar_url: 'pictures/men/img5.jpg')

amsterdam_addresses = ['Van Diemenstraat 408 Amsterdam, Netherlands', 'Barentszstraat 171 Amsterdam, Netherlands', 'Gedempt Hamerkanaal 201 Amsterdam, Netherlands', 'Goudsbloemstraat 91 Amsterdam, Netherlands', 'Lindengracht 90 Amsterdam, Netherlands', 'Lindengracht 75 Amsterdam, Netherlands', 'Prinsenstraat 22 Amsterdam, Netherlands', 'De Ruijterkade 128 Amsterdam, Netherlands', 'Herengracht 90 Amsterdam, Netherlands', 'Lijnbaanssteeg 5-7 Amsterdam, Netherlands', 'Westermarkt 11 Amsterdam, Netherlands', 'Singel 210 Amsterdam, Netherlands', 'Nieuwezijds Voorburgwal 200 Amsterdam, Netherlands', 'Gasthuismolensteeg 5HS Amsterdam, Netherlands', 'Oudezijds Voorburgwal 177-179 Amsterdam, Netherlands', 'Peperstraat 10 Amsterdam, Netherlands', 'Marnixstraat 192B Amsterdam, Netherlands', 'Bellamyplein 51 Amsterdam, Netherlands', 'Funenkade 7 Amsterdam, Netherlands', 'Amstel 212 Amsterdam, Netherlands', 'Utrechtsestraat 6 Amsterdam, Netherlands', 'Leidsestraat 94 Amsterdam, Netherlands', 'Herengracht 542-556 Amsterdam, Netherlands', 'Utrechtsestraat 109-111 Amsterdam, Netherlands', 'Vijzelgracht 15 Amsterdam, Netherlands', 'Museumstraat 1 Amsterdam, Netherlands', 'Frans Halsstraat 28 Amsterdam, Netherlands', 'Gerard Doustraat 98 Amsterdam, Netherlands', 'Albert Cuypstraat 58-60 Amsterdam, Netherlands', 'Tweede van der Helststraat 3 Amsterdam, Netherlands']

automatic_barbers = []

5.times do |i|
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'secret', name: Faker::Name.male_first_name + " " + Faker::Name.last_name,
    host_service_address: amsterdam_addresses[Faker::Number.unique.within(0..29)],
    avatar_url: "pictures/men/img#{i + 1}.jpg")
end
  5.times do |i|
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'secret', name: Faker::Name.female_first_name + " " + Faker::Name.last_name,
    host_service_address: amsterdam_addresses[Faker::Number.unique.within(0..29)],
    avatar_url: "pictures/women/img#{i + 1}.jpg")
end
 10.times do |i|
  User.create!(email: Faker::Internet.unique.email, password: 'secret', name: Faker::Name.male_first_name + " " + Faker::Name.last_name, commute_area_address: amsterdam_addresses[Faker::Number.unique.within(0..29)], commute_area_radius: (1..10).to_a[Faker::Number.within(0..9)], commute_price: (1..10).to_a[Faker::Number.within(0..9)], avatar_url: "pictures/men/img#{i + 10}.jpg")
end
5.times do |i|
  User.create!(email: Faker::Internet.unique.email, password: 'secret', name: Faker::Name.female_first_name + " " + Faker::Name.last_name, commute_area_address: amsterdam_addresses[Faker::Number.unique.within(0..29)], commute_area_radius: (1..10).to_a[Faker::Number.within(0..9)], commute_price: (1..10).to_a[Faker::Number.within(0..9)], host_service_address: amsterdam_addresses[Faker::Number.unique.within(0..29)], avatar_url: "pictures/women/img#{(i + 9) % 14 + 1}.jpg")
end
puts 'Done!'

puts 'Creating image urls'
# this way there is the possibility that a barber has the same image multiple times, but it is unlikely
User.all.each do |user|
  10.times do |i|
    ImageUrl.create!(user: user, url: "pictures/haircut#{Faker::Number.within(1..51) + i}.jpg")
  end
end
puts 'Done!'

puts 'Creating services'
haircut = Service.new(title: 'Clean High quality Hair cut', description: "It's a dope haircut.", duration: 40, price: 35)
haircut.barber = rebekah
haircut.save!

haircut = Service.new(title: 'Professional neat Hair cut', description: "It's a dope professional haircut.", duration: 40, price: 25)
haircut.barber = rebekah
haircut.save!

haircut = Service.new(title: 'Taper Haircut and Lineup', description: "It's a dope lineup and fade.", duration: 40, price: 45)
haircut.barber = rebekah
haircut.save!

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

# create more haircuts and beard trims so that each user has at least a service except for killian
15.times do
  Service.create!(
    title: Faker::Music.band + ' haircut',
    description: Faker::Company.bs,
    duration: (2..6).to_a[Faker::Number.within(0..4)] * 10,
    price: (1..20).to_a[Faker::Number.within(0..19)] * 5,
    barber: User.find(Faker::Number.unique.within(User.first.id + 5..User.last.id)) # the first 5 users I seeded manually above
  )
end
10.times do
  Service.create!(
    title: Faker::Music.band + ' beard trim',
    description: Faker::Company.bs,
    duration: (2..6).to_a[Faker::Number.within(0..4)] * 10,
    price: (1..20).to_a[Faker::Number.within(0..19)] * 5,
    barber: User.find(Faker::Number.unique.within(User.first.id + 5..User.last.id)) # the first 5 users I seeded manually above
  )
end
10.times do
  Service.create!(
    title: Faker::Music.band + ' beard trim',
    description: Faker::Company.bs,
    duration: (2..6).to_a[Faker::Number.within(0..4)] * 10,
    price: (1..20).to_a[Faker::Number.within(0..19)] * 5,
    barber: User.find(Faker::Number.within(User.first.id + 5..User.last.id)) # the first 5 users I seeded manually above
  )
end
puts 'Done!'

puts 'Creating appointments'
appt = Appointment.new(location_address: 'Ingogostraat 14D, Amsterdam', datetime: Time.new(2019, 3, 31, 19, 0, 0, "+01:00"))
appt.service = haircut1
appt.barber = appt.service.barber
appt.client = killian
appt.save!

appt1 = Appointment.new(location_address: 'Amsterdam Transvaalstraat 17', datetime: Time.new(2019, 3, 7, 14, 0, 0, "+01:00"))
appt1.service = beard1
appt1.barber = appt1.service.barber
appt1.client = killian
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

killian_review = Review.new(content: 'killian is a nice guy to have a chat with, his apartment does not smell bad and he seem to shower regularly, judging from his incredibly silky hair...', rating: 5, barber_review: false)
killian_review.receiver = killian
killian_review.author = fred
killian_review.save!

rebekah_review1 = Review.new(content: '- Rebekah Kohler IV was great, she was extremely friendly and clearly knows what she’s doing, I’ll definitely be going back to her again.', rating: 5, barber_review: false)
rebekah_review1.receiver = rebekah
rebekah_review1.author = isaac
rebekah_review1.save!

rebekah_review2 = Review.new(content: 'Had a great experience with “Barber Name”, I went to her after another barber messed my hair up and she completely saved it. Will definitely recommend her to all my friends.', rating: 5, barber_review: false)
rebekah_review2.receiver = rebekah
rebekah_review2.author = ivan
rebekah_review2.save!

rebekah_review3 = Review.new(content: 'Went to Rebekah Kohler IV for a haircut and beard-trim and she did a great job, she was professional and friendly, the salon itself was also very cool. Even gave me a cup of coffee.', rating: 5, barber_review: false)
rebekah_review3.receiver = rebekah
rebekah_review3.author = tom
rebekah_review3.save!

rebekah_review4 = Review.new(content: 'Impressed with how prompt and nicely I was treated before getting my hair perfectly cut. The honesty and the friendliness of how this was handled left me with a really good feeling.
Happy with the haircut and glad to meet someone who cares about customer service. Rebekah Kohler IV has won me over! For sure I’ll be there again soon :) thank you!', rating: 5, barber_review: false)
rebekah_review4.receiver = rebekah
rebekah_review4.author = killian
rebekah_review4.save!


# Add automatic reviews for automatically seeded barbers (all but 5, which will remain without reviews)
User.where(id: User.first.id + 1..User.last.id - 5).each do |user|
  Review.create!(
    content: Faker::Quote.most_interesting_man_in_the_world,
    rating: Faker::Number.within(0..5),
    barber_review: true,
    receiver: user,
    author: User.where.not(id: user.id)[Faker::Number.within(0..User.count - 2)]
  )
end
# then I add more reviews randomly to users
30.times do
  receiver = User.find(Faker::Number.within(User.first.id + 1..User.last.id))
  Review.create!(
    content: Faker::Quote.most_interesting_man_in_the_world,
    rating: Faker::Number.within(0..5),
    barber_review: true,
    receiver: receiver,
    author: User.where.not(id: receiver.id)[Faker::Number.within(0..User.count - 2)]
  )
end

puts 'Done!'

puts 'Creating messages'
message = Message.new(content: 'Hi beardlova, remember where my house is right?')
message.appointment = appt1
message.author = ivan
message.receiver = killian
message.save!
puts 'Done!'
