require 'rails_helper'

RSpec.describe "FoodFacade" do
  it 'should call the facade and retieve search results' do
    search_term = 'sweet potato'

    results = FoodFacade.food_search(search_term)
    expect(results).to be_an(Array)
    
    next_food = results.first
    expect(next_food).to be_a(Food)
    expect(next_food.upc).to eq('20042431') 
    expect(next_food.description).to eq('SWEET POTATO') 
    expect(next_food.brand).to eq('FRESH & EASY') 
    expect(next_food.ingredients).to eq('SWEET POTATO, CHIPOTLE CHICKEN {COOKED CHICKEN (CHICKEN BREAST WITH RIB MEAT, CHICKEN BROTH, CONTAINS LESS THAN 2% OF: MODIFIED POTATO STARCH, GARLIC POWDER, CANOLA OIL, SOYBEAN OIL, SALT, SODIUM PHOSPHATE, CHICKEN FAT, FLAVOR), CHIPOTLE MANGO SAUCE [MANGO CHIPOTLE MARINADE (MANGO PUREE, WATER, CHIPOTLE PEPPER, ONION, SALT, BROWN SUGAR, CANOLA OIL, VINEGAR, GARLIC, LEMON JUICE CONCENTRATE, TOMATO PASTE, SPICES, RICE WINE VINEGAR, SUGAR, CILANTRO, CITRIC ACID)], WATER, CILANTRO}, MANGO SALSA (MANGO, CUCUMBER, TOMATO, LIME JUICE, MANGO PUREE, ONION, CILANTRO, SERRANO PEPPERS, SALT).') 
  end
end