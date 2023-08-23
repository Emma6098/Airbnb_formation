# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Formation.destroy_all
User.destroy_all
require 'faker'

users = 10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end



puts "creating formations"
formations = Formation.create([
  {user_id: User.first.id , title: "C'est JS les amis !", theme: "JS", date: Date.new(2001,2,3), description: "Vous avez compris que les études sup c'était du scam et ça sent le foin dans votre vie ? Pas de soucis on va prendre le taureau par les cornes et ce sera thanks three ! Que vous veniez de France ou de Navarre, beau gosse ou pas peu importe avec un peu de mano et de cool Raoult ça se passera bien. Et puis à la fin en de la formation en js vous pourrez faire une fusée , non je rigole vous pourrez juste faire une liste de course.", price: 500, address: "16 Villa Gaudelet, Paris"},
  {user_id: User.second.id, title: "Rails avec Hollywood fraîcheur", theme: "Rails", date: Date.new(2001,2,5), description:"Vous voulez un prof qui fait les plus beaux schémas ? C'est carrément ici. Le truc c'est que pour réussir en rails il faut toujours un chew-gum et surtout arriver frais et flex dès le matin. Enfin genre si tu veux mon secret pour être un bon formateur c'est qu'il faut comprendre que quand un étudiant disait ok à une explication c'est qu'il n'avait absolument rien compris.", price: 200, address: "16 Villa Gaudelet, Paris"},
  {user_id: User.second.id, title: "Le code et gastronomie", theme: "OOP", date: Date.new(2001,4,5), description:"Pourquoi apprendre à faire un cookbook quand on peut manger de l'aioli et un pain perdu à 2 pas de chez moi ? Avec moi serez heureux c'est l'essentiel ", price: 800, address: "16 Villa Gaudelet, Paris"},
  {user_id: User.second.id, title: "HTML CSS en détente", theme: "HTML/CSS", date: Date.new(2001,2,3), description: "Mon secret ? C'est d'arriver 1h10 en avance pour êtré décrié par mes étudiant croyants que je suis en réalité retard. Et puis l'avantage dans le code c'est qu'on peut avoir 17 ans tout étant un très bon prof", price: 100, address: "distanciel"} ])

puts "finished formations"
