require "Rspec"
require "./lib/building"

describe "building" do
    before :each do
        @building = Building.new

        @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
        @unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
        @unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
        @unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 2, bedrooms: 3})

        @renter1 = Renter.new("Spencer")
        @renter2 = Renter.new("Jessie")
        @renter3 = Renter.new("Max")
    end

    it "is an instance of Building" do
        expect(@building).to be_a Building
    end

    it "can add units" do
        expect(@building.units).to eq []

        @building.add_unit(@unit1)
        @building.add_unit(@unit2)

        expect(@building.units).to be_a Array
        expect(@building.units).to include @unit1
        expect(@building.units).to include @unit2
    end

    it "can list renters" do
        expect(@building.renters).to eq []

        @building.add_unit(@unit1)
        @building.add_unit(@unit2)

        @unit1.add_renter(@renter1)
        @unit2.add_renter(@renter2)

        expect(@building.renters).to include "Spencer"
        expect(@building.renters).to include "Jessie"
    end

    it "can find the average rent" do
        @building.add_unit(@unit1)
        @building.add_unit(@unit2)

        expect(@building.average_rent).to eq 1099.5
    end

    it "can list occupied rooms" do
        @building.add_unit(@unit1)
        @building.add_unit(@unit2)
        @building.add_unit(@unit3)

        expect(@building.rented_units).to eq []

        @unit2.add_renter(@renter2)

        expect(@building.rented_units).to include @unit2
    end

    it "finds the renter with the heighest rent" do
        @building.add_unit(@unit1)
        @building.add_unit(@unit2)
        @building.add_unit(@unit3)

        @unit2.add_renter(@renter2)

        expect(@building.renter_with_highest_rent).to eq @renter2

        @unit1.add_renter(@renter1)

        expect(@building.renter_with_highest_rent).to eq @renter1

        @unit3.add_renter(@renter3)

        expect(@building.renter_with_highest_rent).to eq @renter1
    end

    it "returns a hash ordered by number of bedrooms" do
        @building.add_unit(@unit1)
        @building.add_unit(@unit2)
        @building.add_unit(@unit3)
        @building.add_unit(@unit4)

        expect(@building.units_by_number_of_bedrooms[3]).to be_a Array
        expect(@building.units_by_number_of_bedrooms[3]).to include "D4"
    end

    it "can give an annual breakdown" do
        @building.add_unit(@unit1)
        @building.add_unit(@unit2)
        @building.add_unit(@unit3)

        @unit2.add_renter(@renter1)
        @unit1.add_renter(@renter2)

        expect(@building.annual_breakdown["Spencer"]).to eq 11988
        expect(@building.annual_breakdown["Jessie"]).to eq 14400
    end

    it "can give back the rented units" do
        @building.add_unit(@unit1)
        @building.add_unit(@unit2)
        @building.add_unit(@unit3)

        @unit2.add_renter(@renter1)
        @unit1.add_renter(@renter2)

        expect(@building.rooms_by_renter).to be_a Hash
        expect(@building.rooms_by_renter.length).to eq 2
        expect(@building.rooms_by_renter[@renter1][:bathrooms]).to eq 2
        expect(@building.rooms_by_renter[@renter2][:bedrooms]).to eq 1
    end
end