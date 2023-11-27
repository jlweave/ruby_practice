# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
astronaut1 = Astronaut.create!(name: "Buzz Lightyear", age: 32, job: "Cheap-slogans")
astronaut2 = Astronaut.create!(name: "Roger Chaffe", age: 31, job: "Comander")
astronaut3 = Astronaut.create!(name: "Virgil Grissom", age: 40, job: "First in Orbit")
astronaut4 = Astronaut.create!(name: "Edward White II", age: 36, job: "First in Moonwalk")