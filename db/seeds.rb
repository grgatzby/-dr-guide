
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
