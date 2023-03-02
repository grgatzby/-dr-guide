# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"

Experience.destroy_all

experience = Experience.create(
  title: "Acropolis visit",
  category: "Sight seeing",
  location: "Athens",
  description: "Make the most of your time in Athens with skip-the-ticket-line access to the Acropolis. Upgrade with optional entry to the Acropolis Museum, Ancient Agora, Roman Forum, Kerameikos, Temple of Zeus, or the National Archaeological Museum.",
  user: User.first
)
file = URI.open("https://res.cloudinary.com/dgndoabic/image/upload/v1677603354/ng2yzv49feaj1djntxvj.jpg")
experience.photo.attach(io: file, filename: "experience-acropilis.jpg", content_type: "image/png")

experience = Experience.create!(
  title: "Wine tasting Paris",
  category: "Wine tasting",
  location: "Paris",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
  user: User.first
)
file = URI.open("https://res.cloudinary.com/dgndoabic/image/upload/v1677603372/cabi27axbianh0izfman.jpg")
experience.photo.attach(io: file, filename: "experience-paris.jpg", content_type: "image/png")

experience = Experience.create(
  title: "Walk around Paris",
  category: "Sight seeing",
  location: "Paris",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
  user: User.first
)
file = URI.open("https://res.cloudinary.com/dgndoabic/image/upload/v1677603372/cabi27axbianh0izfman.jpg")
experience.photo.attach(io: file, filename: "experience-paris.jpg", content_type: "image/png")

experience = Experience.create(
  title: "Little Venice",
  category: "Sight seeing",
  location: "London",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
  user: User.first
)
file = URI.open("https://res.cloudinary.com/dgndoabic/image/upload/v1677603396/tnfystrq72vyabvdvcuy.jpg")
experience.photo.attach(io: file, filename: "experience-little-venice.jpg", content_type: "image/png")

experience = Experience.create(
  title: "Riding in the pampa",
  category: "Horse riding",
  location: "Navacerrada, Spain",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
  user: User.first
)
file = URI.open("https://res.cloudinary.com/dgndoabic/image/upload/v1677603382/sw8lkvckwmvg5utw0su9.jpg")
experience.photo.attach(io: file, filename: "experience-horse-riding.jpg", content_type: "image/png")

experience = Experience.create(
  title: "Red sea flora",
  category: "Scuba diving",
  location: "Sharm El-Sheikh, Egypt",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
  user: User.first
)
file = URI.open("https://res.cloudinary.com/dgndoabic/image/upload/v1677625353/mhsdyfgvhebxo3nffpny.jpg")
experience.photo.attach(io: file, filename: "experience-scuba.jpg", content_type: "image/png")

experience = Experience.create(
  title: "Visit the Marolles",
  category: "Sight seeing",
  location: "Brussels",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
  user: User.first
)
file = URI.open("https://res.cloudinary.com/dgndoabic/image/upload/v1677603650/ofrgk1e8q18igszn2cix.jpg")
experience.photo.attach(io: file, filename: "experience-brussels.jpg", content_type: "image/png")
