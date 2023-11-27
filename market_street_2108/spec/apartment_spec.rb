require "Rspec"
require "./lib/apartment"

describe "Apartment" do
    before :each do
        @jessie = Renter.new("Jessie")
        @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    end

    it "has a unit number" do
        expect(@unit1.number).to eq "A1"
    end

    it "has a monthly rent" do
        expect(@unit1.monthly_rent).to eq 1200
    end

    it "has bathrooms" do
        expect(@unit1.bathrooms).to eq 1
    end

    it "has bedrooms" do
        expect(@unit1.bedrooms).to eq 1
    end

    it "can have a renter" do
        expect(@unit1.renter).to eq nil

        @unit1.add_renter(@jessie)

        expect(@unit1.renter).to eq @jessie
    end
end