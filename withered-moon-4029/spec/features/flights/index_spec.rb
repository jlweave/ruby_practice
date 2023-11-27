require 'rails_helper'

RSpec.describe "Flight Index Page" do
  before(:each) do
    @frontier = Airline.create!(name: "Frontier")
    @spirit = Airline.create!(name: "Spirit")
    @delta = Airline.create!(name: "Delta")

    @f1727 = @frontier.flights.create!(number: 1727, date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
    @f1838 = @frontier.flights.create!(number: 1838, date: "08/10/20", departure_city: "Denver", arrival_city: "Reno")
    @f2222 = @frontier.flights.create!(number: 2222, date: "08/02/21", departure_city: "Denver", arrival_city: "Reno")
    @f3333 = @frontier.flights.create!(number: 333, date: "08/02/22", departure_city: "Denver", arrival_city: "Reno")

    @f1002 = @spirit.flights.create!(number: 1002, date: "08/13/20", departure_city: "Denver", arrival_city: "Reno")
    @f2003 = @spirit.flights.create!(number: 2003, date: "08/10/20", departure_city: "Denver", arrival_city: "Reno")
    @f3003 = @spirit.flights.create!(number: 3003, date: "08/02/21", departure_city: "Denver", arrival_city: "Reno")
    @f4004 = @spirit.flights.create!(number: 4004, date: "08/02/22", departure_city: "Denver", arrival_city: "Reno")

    @f7777 = @delta.flights.create!(number: 7777, date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
    @f8888 = @delta.flights.create!(number: 8888, date: "08/10/20", departure_city: "Denver", arrival_city: "Reno")
    @f9999 = @delta.flights.create!(number: 9999, date: "08/02/21", departure_city: "Denver", arrival_city: "Reno")

    @kait = Passenger.create!(name: "kait", age: 6)
    @joe = Passenger.create!(name: "Joe", age: 7)
    @sam = Passenger.create!(name: "Sam", age: 17)
    @bo = Passenger.create!(name: "Bo", age: 37)
    @tony = Passenger.create!(name: "Tony", age: 27)
    @ben = Passenger.create!(name: "Ben", age: 55)

    @combo1 = FlightPassenger.create!(flight: @f1727, passenger: @kait)
    @combo2 = FlightPassenger.create!(flight: @f1727, passenger: @joe )
    @combo3 = FlightPassenger.create!(flight: @f1727, passenger: @sam)
    @combo4 = FlightPassenger.create!(flight: @f1727, passenger: @bo )
    @combo4 = FlightPassenger.create!(flight: @f1002, passenger: @bo )
    @combo5 = FlightPassenger.create!(flight: @f1002, passenger: @tony)
    @combo6 = FlightPassenger.create!(flight: @f1002, passenger: @ben )
    @combo7 = FlightPassenger.create!(flight: @f1002, passenger: @kait )
    @combo5 = FlightPassenger.create!(flight: @f7777, passenger: @tony)
    @combo6 = FlightPassenger.create!(flight: @f7777, passenger: @ben )
    @combo3 = FlightPassenger.create!(flight: @f1838, passenger: @sam)
 end

  describe "User Story 1, Flights Index Page" do
    describe "I see a list of all flight numbers" do
      describe "And next to each flight number I see the name of the Airline of that flight" do
        it "And under each flight number I see the names of all that flight's passengers " do
          visit flights_path
          expect(page).to have_content("#{@tony.name}")
          expect(page).to have_content("#{@ben.name}")
          expect(page).to have_content("#{@f1002.number}")
          save_and_open_page
          within("#flight-list-#{@f1838.id}") do  
            expect(page).to have_content("#{@f1838.number}")
            expect(page).to have_content("#{@f1838.airline.name}")
            expect(page).to have_content("#{@sam.name}")
            expect(page).to_not have_content("#{@kait.name}")
          end


          within("#flight-list-#{@f1727.id}") do        
            expect(page).to have_content("#{@f1727.number}")
            expect(page).to have_content("#{@f1727.airline.name}")
            expect(page).to have_content("#{@kait.name}")
            expect(page).to have_content("#{@joe.name}")
            expect(page).to have_content("#{@sam.name}")
            expect(page).to have_content("#{@bo.name}")
            expect(page).to_not have_content("#{@tony.name}")
            expect(page).to_not have_content("#{@ben.name}")
          end
        end

        it "allows for passengers to be removed from flight" do
          visit flights_path
          expect(page).to have_content("#{@sam.name}")
          
          within("#flight-list-#{@f1727.id}") do
            within("#passengers-list-#{@sam.id}") do
              expect(page).to have_content("#{@sam.name}")
              click_link ('Remove Passenger')
            end
          end

          expect(current_path).to eq(flights_path)
          expect(page).to have_content("#{@sam.name}")

          within("#flight-list-#{@f1727.id}") do
            expect(page).to_not have_content(@sam.name)
          end
        end 
      end
    end
  end
end