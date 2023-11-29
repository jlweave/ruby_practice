require 'rails_helper'

  RSpec.describe "Airline Show Page" do
  before(:each) do
    @frontier = Airline.create!(name: "Frontier")
    @spirit = Airline.create!(name: "Spirit")
    @delta = Airline.create!(name: "Delta")

    @f1727 = @frontier.flights.create!(number: 1727, date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
    @f1838 = @frontier.flights.create!(number: 1838, date: "08/10/20", departure_city: "Denver", arrival_city: "Reno")
    @f1002 = @spirit.flights.create!(number: 1002, date: "08/13/20", departure_city: "Denver", arrival_city: "Reno")

    @kait = Passenger.create!(name: "kait", age: 6)
    @joe = Passenger.create!(name: "Joe", age: 7)
    @sam = Passenger.create!(name: "Sam", age: 18)
    @bo = Passenger.create!(name: "Bo", age: 37)
    @tony = Passenger.create!(name: "Tony", age: 27)
    @ben = Passenger.create!(name: "Ben", age: 5)


    @combo1 = FlightPassenger.create!(flight: @f1727, passenger: @kait)
    @combo2 = FlightPassenger.create!(flight: @f1727, passenger: @joe )
    @combo3 = FlightPassenger.create!(flight: @f1727, passenger: @sam)
    @combo4 = FlightPassenger.create!(flight: @f1727, passenger: @bo )
    @combo4 = FlightPassenger.create!(flight: @f1002, passenger: @bo )
    @combo5 = FlightPassenger.create!(flight: @f1002, passenger: @tony)
    @combo6 = FlightPassenger.create!(flight: @f1002, passenger: @ben )
  end

  describe "User Story 3, airline's show page" do
    describe "Then I see a list of passengers that have flights on that airline" do
      describe "And I see that this list is unique (no duplicate passengers)" do
        it"And I see that this list only includes adult passengers (i.e. 18 years or older)" do
          visit  airline_path(@frontier.id)
          expect(page).to_not have_content("#{@tony.name}")
          expect(page).to_not have_content("#{@kait.name}")
          expect(page).to_not have_content("#{@joe.name}")

          expect(page).to have_content("#{@sam.name}")
          expect(page).to have_content("#{@bo.name}")
          save_and_open_page

          visit airline_path(@spirit.id)
          expect(page).to have_content("#{@tony.name}")
          expect(page).to have_content("#{@bo.name}")
          expect(page).to_not have_content("#{@ben.name}")
        end
      end
    end
  end
end