
require 'faker'
require "open-uri"

puts "--Destroying databases--"
puts "------------------------"
Review.destroy_all
Experience.destroy_all
User.destroy_all

puts "----Seeding 20 users----"
puts "------------------------"

20.times do |i|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "bear#{i}@gmail.com",
    password: "123456"
  )
end

users = User.all

experience_acropolis = {
  name: "experience_acropolis",
  title: "Acropolis visit",
  category: "Sight seeing",
  location: "Athens",
  description: "Make the most of your time in Athens with skip-the-ticket-line access to the Acropolis. Upgrade with optional entry to the Acropolis Museum, Ancient Agora, Roman Forum, Kerameikos, Temple of Zeus, or the National Archaeological Museum.",
  photo1: "https://visiterathenes.fr/images/athenes.jpg",
  photo2: "https://visiterathenes.fr/images/parthenon-acropolis.jpg",
  photo3: "https://visiterathenes.fr/images/erechteion.jpg"
}

experience_spain = {
  name: "experience_spain",
  title: "Breathtaking Sierra Nevada Mountain Ride",
  category: "Horse riding",
  location: "Sierra Nevada",
  description: "Make the most of the spectacular surroundings of the Alpujarra hills and Sierra Nevada mountains on this fun horse riding holiday in Spain. You will enjoy two full days of trekking in the area and spend a night in a remote mountain cottage for a horse riding holiday with a difference. Go learn to horse ride beautiful Andalusian horses at this idyllic retreat in the heart of the Sierra Nevada mountains in Spain and immerse yourself in equestrian life on this unique horse riding holiday like no other!",
  photo1: "https://photos.tpn.to/jk/hm/hm/qp/653x490.jpg",
  photo2: "https://photos.tpn.to/qk/em/gh/jr/653x490.jpg",
  photo3: "https://photos.tpn.to/lh/gj/jt/pg/653x490.jpg"
}

experience_egypt = {
  name: "experience_egypt",
  title: "Liveaboard Diving in Egypt",
  category: "Scuba diving",
  location: "Sharm el Sheikh, Egypt",
  description: "Liveaboard diving in the Egyptian Red Sea is spectacular, the land is known for its ancient history - Pharaohs and Pyramids but is also a mecca for scuba divers and snorkellers. Wrecks, colourful corals and big fish abound but it's the off-shore sites such as Daedalus, The Brothers & St. Johns, only reachable by dive liveaboards which can provide the ultimate thrill and the best experience.",
  photo1: "https://d2io85bc6qsg2z.cloudfront.net/picture_library/boat/4419/emperor-elite-2021-01w857h570crwidth857crheight570.jpg",
  photo2: "https://www.planetware.com/wpimages/2021/03/egypt-red-sea-diving-best-dive-sites-sharm-el-sheikh-dive-beach-combo-vacations.jpg",
  photo3: "https://www.planetware.com/wpimages/2021/03/egypt-red-sea-diving-best-dive-sites-dahab-learner-divers-long-time-dive-stays.jpg"
}

experience_brussels = {
  name: "experience_brussels",
  title: "Visit the Marolles in Brussels",
  category: "Sight seeing",
  location: "Brussels",
  description: "The Marolles is an old but lively Brussels neighborhood located between the Palace of Justice and the Brussels-South railway station. By exploring its charming streets lined with antique and vintage shops, along with its small galleries and flea market, you’ll undoubtedly be won over by its unique atmosphere.",
  photo1: "https://img.theculturetrip.com/1440x/smart/images/56-3983817-1445372892d1112ab172764bf2a9a2c7ae4780a769.jpg",
  photo2: "https://cdn.theculturetrip.com/images/56-3983819-1445372897181169e55b5646508651f3b46d665cb5.jpg",
  photo3: "https://img.theculturetrip.com/1440x/smart/images/56-3983813-1445372882b168a4a86f6442338a24038d826f60d1.jpg"
}

experience_paris = {
  name: "experience_paris",
  title: "From the Louvre and Eiffel Tower to the lesser-known Buttes-Chaumont",
  category: "Sight seeing",
  location: "Paris",
  description: "We’re sure you’ve got the most famous of Paris sights and attractions right at the top of your holiday hit list. But what else should you try to squeeze into your packed Parisian itinerary? There’s almost too much to see and do in the French capital, let’s be honest, so we’re here to give you some guidance. From a charming mecca for bibliophiles to a stunning off-the-beaten-track park near Belleville, trust us: you’ll never get bored in the City of Light. This is our ultimate guide to sightseeing in Paris. So here we go, strap in, and get ready to say bonjour to these incredible sights.",
  photo1: "https://media.timeout.com/images/100004361/1536/1152/image.jpg",
  photo2: "https://media.timeout.com/images/103952107/1536/864/image.jpg",
  photo3: "https://media.timeout.com/images/100014673/1536/1152/image.jpg"
}

experience_newengland = {
  name: "experience_newengland",
  title: "Gorgeous beaches and mountains, Colonial history, food and family fun",
  category: "Sight seeing",
  location: "New england",
  description: "What can you expect from a visit to the New England states of Maine, Vermont, New Hampshire, Massachusetts, Rhode Island, and Connecticut? For starters, everyone’s seen images of the region’s natural beauty: the craggy coastline of Maine, the blazing fall foliage of Vermont, the mountain peaks of New Hampshire. Moving toward the middle and southern states: the dune grasses and beaches of Cape Cod and heroes of the American Revolution in Massachusetts, the Colonial streets and Newport mansions of Rhode Island, and the classic town greens and steepled churches of Connecticut.",
  photo1: "https://www.visitnewengland.com/adservimage/16845.jpg",
  photo2: "https://www.visitnewengland.com/adservimage/17270.jpg",
  photo3: "https://www.visitnewengland.com/adservimage/17275.jpg"
}

experience_slovenia = {
  name: "experience_slovenia",
  title: "Trek a scenic part of the international trail in Slovenia across the Alps and experience the mountains up-close on this hiking holiday.",
  category: "Adventure",
  location: "Slovenia",
  description: "Hiking is one of the top things to do in Slovenia; discover the rich history from both world wars along the way; hike from Cerkno to Bohinj in 4 days in one of the most scenic regions of the Slovenian Alps; experience Triglav National Park, Vogel, Franja Partisan Hospital, the Valley of Triglav Lakes, Bohinj, and other highlights of the Julian Alps",
  photo1: "https://b2670268.smushcdn.com/2670268/wp-content/uploads/triglav-lakes.jpg?lossy=1&strip=1&webp=1",
  photo2: "https://b2670268.smushcdn.com/2670268/wp-content/uploads/Hospital-Franja.jpg?lossy=1&strip=1&webp=1",
  photo3: "https://b2670268.smushcdn.com/2670268/wp-content/uploads/Savica-Bohinj-scaled-2.jpg?lossy=1&strip=1&webp=1"
}

experience_ireland = {
  name: "experience_ireland",
  title: "See how spring refreshes the entire island of Ireland with blooming flowers and bruised sunsets",
  category: "Landscapes",
  location: "Ireland",
  description: "A copper coast in Ireland? You better believe it. Bookended by the Waterford towns of Tramore in the east and Dungarvan in the west, this awesome seaside stretch derives its name from the flourishing copper industry that built up here in the 19th century. Springtime brings blooming flowers and watercolour sunsets.",
  photo1: "https://b2670268.smushcdn.com/2670268/wp-content/uploads/triglav-lakes.jpg?lossy=1&strip=1&webp=1",
  photo2: "https://b2670268.smushcdn.com/2670268/wp-content/uploads/Hospital-Franja.jpg?lossy=1&strip=1&webp=1",
  photo3: "https://b2670268.smushcdn.com/2670268/wp-content/uploads/Savica-Bohinj-scaled-2.jpg?lossy=1&strip=1&webp=1"
}

experience_amsterdam = {
  name: "experience_amsterdam",
  title: "Golden Age canals lined by tilting gabled buildings are the backdrop for Amsterdam's treasure-packed museums, vintage-filled shops and hyper-creative drinking, dining and design scenes.",
  category: "Sight seeing",
  location: "Amsterdam, Netherlands",
  description: "Amsterdam's canal-woven core is laced by atmospheric narrow lanes. You never know what you'll find: a tiny hidden garden; a boutique selling witty, stylised Dutch-designed homewares and fashion; a jewel-box-like jenever (Dutch gin) distillery; a flower stall filled with tulips in a rainbow of hues; an old monastery-turned-classical-music-venue; an ultra-niche restaurant such as an all-avocado specialist or one reinventing age-old Dutch classics. Fringing the centre, post-industrial buildings in up-and-coming neighbourhoods now house creative enterprises, from art galleries to craft breweries and cutting-edge tech start-ups, as well as some of Europe's hottest clubs.",
  photo1: "https://www.voyagetips.com/wp-content/uploads/2020/03/Rijkmuseum.jpg",
  photo2: "https://www.voyagetips.com/wp-content/uploads/2020/03/place-du-Dam-Amsterdam.jpg",
  photo3: "https://www.voyagetips.com/wp-content/uploads/2020/03/red-light-district-Amsterdam.jpg"
}

experience_portugal = {
  name: "experience_portugal",
  title: "10 Wine Tours You Can't Miss in Porto",
  category: "Wine tour",
  location: "Porto, Portugal",
  description: "Porto is Portugal's second-largest city and was elected Second best city in 2021, Best European Destination in 2017, and awarded as European Leading Destination in 2018. Every year the city attracts thousands of tourists eager to discover the ancient downtown, the typical riverside with colorfully painted houses, to get lost in century-old streets, to enjoy the Portuguese gastronomy, and, of course, to taste its delicious wines and visit the Port wine Cellars.",
  photo1: "https://blog.winetourismportugal.com/hs-fs/hubfs/Grahams-3.jpg?width=2048&name=Grahams-3.jpg",
  photo2: "https://blog.winetourismportugal.com/hs-fs/hubfs/inside-7.jpeg?width=2048&name=inside-7.jpeg",
  photo3: "http://t3.gstatic.com/licensed-image?q=tbn:ANd9GcSwoCxVn-EfRfv6fRfLcDrh-Tu4OsrKoiGYwqmmNPfZ_g_FNYOllGoxiJsZib6L4-CH"
}

experiences = [
  experience_acropolis,
  experience_spain,
  experience_egypt,
  experience_brussels,
  experience_paris,
  experience_newengland,
  experience_slovenia,
  experience_ireland,
  experience_amsterdam,
  experience_portugal
]

puts "--Seeding 10 experiences--"
puts "--------------------------"

experiences.each do |experience|
  puts ">>>>>>> new experience"
  seeded_experience = Experience.new(
    title: experience[:title],
    category: experience[:category],
    location: experience[:location],
    description: experience[:description]
  )
  seeded_experience.user = users.sample
  # attaching 3 photos
  puts ">>>>>>> attach 3 photos"
  seeded_experience.photos.attach(
    io: URI.open(experience[:photo1]),
    filename: "#{experience[:name]}1.jpg",
    content_type: "image/jpg"
  )
  seeded_experience.photos.attach(
    io: URI.open(experience[:photo2]),
    filename: "#{experience[:name]}2.jpg",
    content_type: "image/jpg"
  )
  seeded_experience.photos.attach(
    io: URI.open(experience[:photo3]),
    filename: "#{experience[:name]}3.jpg",
    content_type: "image/jpg"
  )
  seeded_experience.save!
end

puts "-----Seeding reviews------"
puts "--------------------------"

comments = [
  { comment: "A fantastic visit. I went with a bunch of friends", rating: 5 },
  { comment: "A fabulous experience", rating: 4 },
  { comment: "A day to remember", rating: 4 },
  { comment: "Too bad the guide would not speek proper english", rating: 3 },
  { comment: "The place is overrated", rating: 3 },
  { comment: "Really worth the long trip", rating: 4 },
  { comment: "I will kick it off my bucket list, so glad I've done it", rating: 4 },
  { comment: "Will come back with the kids next time", rating: 4 },
  { comment: "I recommend it 100%", rating: 5 },
  { comment: "I found it really expensive", rating: 3 }
]

Experience.all.each do |experience|
  # random number of reviews
  users_cant_review = [experience.user]
  rand(3..10).times do
    comment = comments.sample
    review = Review.new(
      comment: comment[:comment],
      rating: comment[:rating]
    )
    review.user = (users - users_cant_review).sample
    users_cant_review << review.user
    review.experience = experience
    review.save!
  end
end

# 10.times do
#   user = users.sample
#   experience = Experience.new(
#   title: "Acropolis visit",
#   category: "Sight seeing",
#   location: "Athens",
#   description: "Make the most of your time in Athens with skip-the-ticket-line access to the Acropolis. Upgrade with optional entry to the Acropolis Museum, Ancient Agora, Roman Forum, Kerameikos, Temple of Zeus, or the National Archaeological Museum."
#   )
#   experience.user = user
#   experience.save!
# end

# experiences = Experience.all

# experiences.each do |experience|
#   10.times do
#     user = users.sample

#     review = Review.new(
#       comment: Faker::Quote.famous_last_words,
#       rating: rand(3..5)
#     )
#     review.user = user
#     review.experience = experience
#     review.save!
#   end

#   file = URI.open("https://res.cloudinary.com/dgndoabic/image/upload/v1677603650/ofrgk1e8q18igszn2cix.jpg")
#   experience.photos.attach(io: file, filename: "experience-brussels.jpg", content_type: "image/jpg")

#   file = URI.open("https://res.cloudinary.com/dgndoabic/image/upload/v1677603650/ofrgk1e8q18igszn2cix.jpg")
#   experience.photos.attach(io: file, filename: "logo.jpg", content_type: "image/jpg")

#   file = URI.open("https://res.cloudinary.com/dgndoabic/image/upload/v1677603650/ofrgk1e8q18igszn2cix.jpg")
#   experience.photos.attach(io: file, filename: "surfing.jpg", content_type: "image/jpg")

# end
