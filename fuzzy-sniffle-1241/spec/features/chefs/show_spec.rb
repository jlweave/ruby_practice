require 'rails_helper'

RSpec.describe "Chef show page" do
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

    describe "user story 2" do
      describe "when I visit the chef show page" do
        it "I see the name of the chef and a list of all dishes that belong to them" do
          visit chef_path(@chef1)

          expect(page).to have_content(@chef1.name)
          expect(page).to have_content(@dish1.name)
        end

        xit "I see a form to add an existing dish(fill in with :id) to that chef" do
          visit chef_path(@chef1)

          expect(page).to have_field("Add Dish")
          expect(page).to have_button("Submit")
        end

        xit "When I click submit I am redirected to the chief show page and it has been update with the new dish" do

        end
      end
    end

    describe "user story 3" do
      describe "when I visit the chefs show page" do
        it "I see a link to view a list of all ingredients that this chef uses in their dishes" do
          visit chef_path(@chef1)
# save_and_open_page
          expect(page).to have_link(@ingredients1.name)
          expect(page).to have_link(@ingredients3.name)
          expect(page).to_not have_link(@ingredients2.name)
        end

        it "when I click on that link I am taken to a chefs ingredients index page" do
          visit chef_path(@chef1)

          click_link(@ingredients1.name)
          expect(current_path).to eq(chef_ingredients_path(@chef1.id))
         
        end

        it "I can see a unique list of names of all the ingredients that this chef uses" do
          visit chef_ingredients_path(@chef1)
 save_and_open_page
          expect(page).to have_content(@ingredients1.name)
        end
      end
    end
end
