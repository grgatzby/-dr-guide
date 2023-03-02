
require 'faker'
require "open-uri"

puts "Destroying databases"
puts "--------------------"
Review.destroy_all
Experience.destroy_all
User.destroy_all

puts "----Seeding users----"
puts "---------------------"
10.times do |i|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "bear#{i}@gmail.com",
    password: "123456"
  )
end

users = User.all

puts "-Seeding experiences-"
puts "----------------------"

experience_acropolis = {
  title: "Acropolis visit",
  category: "Sight seeing",
  location: "Athens",
  description: "Make the most of your time in Athens with skip-the-ticket-line access to the Acropolis. Upgrade with optional entry to the Acropolis Museum, Ancient Agora, Roman Forum, Kerameikos, Temple of Zeus, or the National Archaeological Museum."}

experience_spain = {
  title: "Horse riding in Spain",
  category: "Horse riding",
  location: "Madrid",
  description: "Enjoy fantastic horse riding in teh Navacerrada pampa, and ride in the sunset."}

experience_brussels = {
  title: "Visit the Marolles in Brussels",
  category: "Sight seeing",
  location: "brussels",
  description: "The Marolles is an old but lively Brussels neighborhood located between the Palace of Justice and the Brussels-South railway station. By exploring its charming streets lined with antique and vintage shops, along with its small galleries and flea market, you’ll undoubtedly be won over by its unique atmosphere."}

experience_brussels = {
    title: "Visit the Marolles in Brussels",
    category: "Sight seeing",
    location: "brussels",
    description: "The Marolles is an old but lively Brussels neighborhood located between the Palace of Justice and the Brussels-South railway station. By exploring its charming streets lined with antique and vintage shops, along with its small galleries and flea market, you’ll undoubtedly be won over by its unique atmosphere."}

10.times do
  user = users.sample
  experience = Experience.new(
    title: "Acropolis visit",
    category: "Sight seeing",
    location: "Athens",
    description: "Make the most of your time in Athens with skip-the-ticket-line access to the Acropolis. Upgrade with optional entry to the Acropolis Museum, Ancient Agora, Roman Forum, Kerameikos, Temple of Zeus, or the National Archaeological Museum.",
  )
  experience.user = user
  experience.save!
end

experiences = Experience.all

experiences.each do |experience|
  10.times do
    user = users.sample

    review = Review.new(
      comment: Faker::Quote.famous_last_words,
      rating: rand(3..5)
    )
    review.user = user
    review.experience = experience
    review.save!
  end

  file = URI.open("https://res.cloudinary.com/dgndoabic/image/upload/v1677603650/ofrgk1e8q18igszn2cix.jpg")
  experience.photos.attach(io: file, filename: "experience-brussels.jpg", content_type: "image/jpg")

  file = URI.open("https://res.cloudinary.com/dgndoabic/image/upload/v1677603650/ofrgk1e8q18igszn2cix.jpg")
  experience.photos.attach(io: file, filename: "logo.jpg", content_type: "image/jpg")

  file = URI.open("https://res.cloudinary.com/dgndoabic/image/upload/v1677603650/ofrgk1e8q18igszn2cix.jpg")
  experience.photos.attach(io: file, filename: "surfing.jpg", content_type: "image/jpg")

end
