# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@chef1 = Chef.create!(name: "Chef Boye")
@chef2 = Chef.create!(name: "Swedish Muppet")
@chef3 = Chef.create!(name: "Lunch Ladie")

@dish1 = @chef1.dishes.create!(name: "mac n cheese", description: "seritonin in cheese form")
@dish2 = @chef1.dishes.create!(name: "ppj", description: "peanut butter jelly sandwich")
@dish3 = @chef1.dishes.create!(name: "ham sandwich", description: "honey roast ham sandwich")
@dish4 = @chef2.dishes.create!(name: "spaghetti", description: "spaghetti and meatballs")
@dish5 = @chef2.dishes.create!(name: "ramen", description: "a dollar full of msg")
@dish6 = @chef2.dishes.create!(name: "grilled cheese", description: "melty cheese sandwich")
@dish7 = @chef3.dishes.create!(name: "ham n cheese", description: "hot ham and cheese sandwich")

@ingredients1 = Ingredient.create!(name: "elbow pasta")
@ingredients2 = Ingredient.create!(name: "spaghetti pasta")
@ingredients3 = Ingredient.create!(name: "cheese")
@ingredients4 = Ingredient.create!(name: "white bread")
@ingredients5 = Ingredient.create!(name: "sliced ham")
@ingredients6 = Ingredient.create!(name: "chicken broth")
@ingredients7 = Ingredient.create!(name: "peanut butter")
@ingredients8 = Ingredient.create!(name: "strawberry jelly")

@dish_ingredients1 = DishIngredient.create!(dish: @dish1, ingredient: @ingredients1)
@dish_ingredients2 = DishIngredient.create!(dish: @dish1, ingredient: @ingredients3)
@dish_ingredients3 = DishIngredient.create!(dish: @dish2, ingredient: @ingredients4)
@dish_ingredients4 = DishIngredient.create!(dish: @dish2, ingredient: @ingredients7)
@dish_ingredients5 = DishIngredient.create!(dish: @dish2, ingredient: @ingredients8)
@dish_ingredients6 = DishIngredient.create!(dish: @dish3, ingredient: @ingredients4)
@dish_ingredients7 = DishIngredient.create!(dish: @dish3, ingredient: @ingredients5)
@dish_ingredients8 = DishIngredient.create!(dish: @dish4, ingredient: @ingredients2)
@dish_ingredients9 = DishIngredient.create!(dish: @dish5, ingredient: @ingredients2)
@dish_ingredients10 = DishIngredient.create!(dish: @dish5, ingredient: @ingredients6)
@dish_ingredients11 = DishIngredient.create!(dish: @dish6, ingredient: @ingredients4)
@dish_ingredients12 = DishIngredient.create!(dish: @dish6, ingredient: @ingredients3)
@dish_ingredients13 = DishIngredient.create!(dish: @dish7, ingredient: @ingredients3)
@dish_ingredients14 = DishIngredient.create!(dish: @dish7, ingredient: @ingredients4)
@dish_ingredients15 = DishIngredient.create!(dish: @dish7, ingredient: @ingredients5)