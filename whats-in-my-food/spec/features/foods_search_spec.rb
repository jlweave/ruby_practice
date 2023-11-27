require "rails_helper"

RSpec.describe "Food Search", type: :feature do
  it 'successfully finds a food items and lists 10 other foods containing that food' do
    visit root_path

    fill_in :q, with: "sweet potato"
    click_button "Search"

    expect(current_path).to eq(foods_path)
    expect(page).to have_content("We found 10 foods containing sweet potato")
    expect(page).to have_css('.food', count: 10)
# save_and_open_page
    within(first('.food')) do
      expect(page).to have_css('.upc')
      expect(page).to have_css('.description')
      expect(page).to have_css('.brand')
      expect(page).to have_css('.ingredients')
    end
  end
end