require 'rails_helper'

RSpec.describe "Welcome Page" do 
    it 'has a form to search for activities' do 
        visit root_path
        
        expect(page).to have_content("Activity Finder")
        expect(page).to have_field(:num_participants)
        expect(page).to have_button("Find Activities")
    end 
end 