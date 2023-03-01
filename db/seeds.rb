# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

Experience.destroy_all

Experience.create(
  title: "Acropolis visit",
  category: "Sight seeing",
  location: "Athens",
  description: "Make the most of your time in Athens with skip-the-ticket-line access to the Acropolis. Upgrade with optional entry to the Acropolis Museum, Ancient Agora, Roman Forum, Kerameikos, Temple of Zeus, or the National Archaeological Museum.",
  user: User.first
)

Experience.create!(
  title: "Wine tasting Paris",
  category: "Wine tasting",
  location: "Paris",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
  user: User.first
)

Experience.create(
  title: "Walk around Paris",
  category: "Sight seeing",
  location: "Paris",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
  user: User.first
)

Experience.create(
  title: "Little Venice",
  category: "Sight seeing",
  location: "London",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
  user: User.first
)

Experience.create(
  title: "Riding in the pampa",
  category: "Horse riding",
  location: "Navacerrada, Spain",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
  user: User.first
)
Experience.create(
  title: "Red sea flora",
  category: "Scuba diving",
  location: "Sharm El-Sheikh, Egypt",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
  user: User.first
)

Experience.create(
  title: "Visit the Marolles",
  category: "Sight seeing",
  location: "Brussels",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
  user: User.first
)
