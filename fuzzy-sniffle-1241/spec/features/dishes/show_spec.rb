require 'rails_helper'

RSpec.describe "Dish show page" do
  before (:each) do
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

    @ingredients1 = Ingredient.create!(name: "elbow pasta", calories: 100)
    @ingredients2 = Ingredient.create!(name: "spaghetti pasta", calories: 150)
    @ingredients3 = Ingredient.create!(name: "cheese", calories: 200)
    @ingredients4 = Ingredient.create!(name: "white bread", calories: 75)
    @ingredients5 = Ingredient.create!(name: "sliced ham", calories: 40)
    @ingredients6 = Ingredient.create!(name: "chicken broth", calories: 25)
    @ingredients7 = Ingredient.create!(name: "peanut butter", calories: 50)
    @ingredients8 = Ingredient.create!(name: "strawberry jelly", calories: 60)

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
  end

  describe "User Story 1" do
    describe "when I visit the dish's show page" do
      it "I see the dish's name and despcription" do
        visit dish_path(@dish1)

        within ("#dish_#{@dish1.id}") do
          expect(page).to have_content(@dish1.name)
          expect(page).to have_content(@dish1.description)
          expect(page).to_not have_content(@dish2.name)
          expect(page).to_not have_content(@dish2.description)
        end
      end

      it "And I see a list of ingredients for that dish" do
        visit dish_path(@dish1)
        within ("#dish_#{@dish1.id}") do
          expect(page).to have_content(@ingredients1.name)
          expect(page).to have_content(@ingredients3.name)
          expect(page).to_not have_content(@ingredients5.name)
          expect(page).to_not have_content(@ingredients7.name)
        end
      end

      it "and a total calorie count for that dish" do
        visit dish_path(@dish1)

         within ("#dish_#{@dish1.id}") do
          expect(page).to have_content(300)
          expect(page).to_not have_content(700)
        end
      end

      it "displays the chef's name" do
         visit dish_path(@dish1)

         within ("#dish_#{@dish1.id}") do
          expect(page).to have_content(@dish1.chef.name)
          expect(page).to_not have_content(@dish4.chef.name)
        end
      end
    end
  end
end

#  <%= require 'pry'; binding.pry %>

 