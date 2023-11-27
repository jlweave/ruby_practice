require "rails_helper"

RSpec.describe "Bulk Discount New Page" do
  before (:each) do
    @m = Merchant.create!(name: "Sammy Samson")
  end

  describe "new" do
    it "has a form to create a new bulk discount for a specific merchant" do
      visit new_merchant_bulk_discount_path(@m)

      fill_in('name', with: "Going out of Business")
      fill_in('percentage', with: 50)
      fill_in('threshold', with: 15)
    end
  end
end