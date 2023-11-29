require 'rails_helper'

RSpec.describe "Food Service" do
  it "searches our API for a food item" do
    search_term = 'sweet potato'

    results = FoodService.search(search_term)
    expect(results).to have_key(:totalHits)

    expect(results).to have_key(:currentPage)
    expect(results[:currentPage]).to eq(1)

    expect(results).to have_key(:foods)
    expect(results[:foods]).to be_an(Array)

    foods = results[:foods]
    expect(foods.length).to eq(10)

    first_food = foods[0]
    expect(first_food).to have_key(:gtinUpc)
    expect(first_food[:gtinUpc]).to be_a(String)
    expect(first_food[:gtinUpc]).to eq('20042431')

    expect(first_food).to have_key(:description)
    expect(first_food[:description]).to be_a(String)
    expect(first_food[:description]).to eq("SWEET POTATO")

    expect(first_food).to have_key(:ingredients)
    expect(first_food[:ingredients]).to be_a(String)
    expect(first_food[:ingredients]).to eq("SWEET POTATO, CHIPOTLE CHICKEN {COOKED CHICKEN (CHICKEN BREAST WITH RIB MEAT, CHICKEN BROTH, CONTAINS LESS THAN 2% OF: MODIFIED POTATO STARCH, GARLIC POWDER, CANOLA OIL, SOYBEAN OIL, SALT, SODIUM PHOSPHATE, CHICKEN FAT, FLAVOR), CHIPOTLE MANGO SAUCE [MANGO CHIPOTLE MARINADE (MANGO PUREE, WATER, CHIPOTLE PEPPER, ONION, SALT, BROWN SUGAR, CANOLA OIL, VINEGAR, GARLIC, LEMON JUICE CONCENTRATE, TOMATO PASTE, SPICES, RICE WINE VINEGAR, SUGAR, CILANTRO, CITRIC ACID)], WATER, CILANTRO}, MANGO SALSA (MANGO, CUCUMBER, TOMATO, LIME JUICE, MANGO PUREE, ONION, CILANTRO, SERRANO PEPPERS, SALT).")

    expect(first_food).to have_key(:brandOwner)
    expect(first_food[:brandOwner]).to be_a(String)
    expect(first_food[:brandOwner]).to eq("FRESH & EASY")
   
  end
end