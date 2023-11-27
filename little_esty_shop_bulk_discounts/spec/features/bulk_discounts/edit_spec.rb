require "rails_helper"

RSpec.describe "Bulk Discount Edit Page" do
  before (:each) do
    @m = Merchant.create!(name: "Sammy Samson")
    @bd = @m.bulk_discounts.create!(name: "This One", percentage: 20, threshold: 5)

    
  end

  describe "User Story 5" do
    describe "After I have click the edit button" do
      it "when I change this information (it has been pre-populated), I click submit and go back to the show page" do
        visit edit_merchant_bulk_discount_path(@m, @bd)

        expect(find('form')).to have_content('Name')
        expect(find('form')).to have_content('Percentage')
        expect(find('form')).to have_content('Threshold')
       
        
        fill_in 'Name', with: "Going out of Business"
        fill_in 'Percentage', with: 50
        fill_in 'Threshold', with: 15

        click_button 'Submit Updated Discount'

        expect(current_path).to eq(merchant_bulk_discount_path(@m.id, @bd.id))

      end
    end
  end
end