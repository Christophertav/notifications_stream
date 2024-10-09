# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


company = Company.create(name: 'Le wagon')
user_company = User.create(actable: company, email: "lewagon@mail.fr", password: "azerty", password_confirmation: "azerty")

alumni = Alumni.create(name: 'Romain')
user_alumni = User.create(actable: alumni, email: "romain@mail.fr", password: "azerty", password_confirmation: "azerty")
