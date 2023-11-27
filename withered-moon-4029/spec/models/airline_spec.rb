require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe 'relationships' do
    it {should have_many :flights}

    it { should have_many(:passengers).through(:flights) }
  end

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
    @ben = Passenger.create!(name: "Sam", age: 55)


    @combo1 = FlightPassenger.create!(flight: @f1727, passenger: @kait)
    @combo2 = FlightPassenger.create!(flight: @f1727, passenger: @joe )
    @combo3 = FlightPassenger.create!(flight: @f1727, passenger: @sam)
    @combo4 = FlightPassenger.create!(flight: @f1727, passenger: @bo )
    @combo4 = FlightPassenger.create!(flight: @f1002, passenger: @bo )
    @combo5 = FlightPassenger.create!(flight: @f1002, passenger: @tony)
    @combo6 = FlightPassenger.create!(flight: @f1002, passenger: @ben )
    @combo7 = FlightPassenger.create!(flight: @f1002, passenger: @kait)
  end

    describe " Airline's Passengers by age" do
      it "returns passengers who are 18 and older" do
        expect(@frontier.adult_passengers_only).to eq([@sam, @bo])
        expect(@frontier.adult_passengers_only).to_not eq([@kait, @joe])

        expect(@spirit.adult_passengers_only).to eq([@bo, @tony, @ben])
        expect(@spirit.adult_passengers_only).to_not eq([@kait])
      end
    end

end
