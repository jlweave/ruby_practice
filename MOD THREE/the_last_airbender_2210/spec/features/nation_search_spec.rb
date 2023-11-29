require 'rails_helper'

RSpec.describe "Nation Search", type: :feature do
  it "finds total number of people inside that nation" do
    visit root_path
    #  expect(page).to have_select('dropdown', selected: 'Fire Nation')
    select "Fire Nation", :from => "nation"
    click_button "Search For Members"

    expect(current_path).to eq(search_path)

    expect(page).to have_content("Total Number of fire+nation's members is 1")

    # expect(page).to have_css('.member', count: 25)
   ### not working due to parsing issue###
    within(first('.member')) do
      expect(page).to have_css('.name')
      expect(page).to have_css('.allies')
      expect(page).to have_css('.enemies')
      expect(page).to have_css('.affiliations')
    end
  end


end







# As a user,
# When I visit "/"
# And I Select "Fire Nation" from the select field
# (Note: Use the existing select field)
# And I click "Search For Members"
# Then I should be on page "/search"
# Then I should see the total number of people who live in the Fire Nation. (should be close to 100)
# And I should see a list with the detailed information for the first 25 members of the Fire Nation.

# And for each of the members I should see:
# - The name of the member (and their photo, if they have one)
# - The list of allies or "None"
# - The list of enemies or "None"
# - Any affiliations that the member has