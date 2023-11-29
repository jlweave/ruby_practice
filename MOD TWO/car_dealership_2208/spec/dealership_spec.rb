require 'rspec'
require './lib/car'
require './lib/dealership'

RSpec.describe Dealership do
  it 'exists'do
    @dealership = Dealership.new("Acme Auto", "123 Main Street")

    expect(@dealership).to be_an_instance_of Dealership
  end

  it 'has inventory' do
    @dealership = Dealership.new("Acme Auto", "123 Main Street")

    expect(@dealership.inventory).to eq([])
    expect(@dealership.inventory_count). to eq(0)
  end

  it 'has cars' do
    @dealership = Dealership.new("Acme Auto", "123 Main Street")
    @car_1 = Car.new("Ford Mustang", 1500, 36)
    @car_2 = Car.new("Toyota Prius", 1000, 48)

  end

  it 'Add cars' do
    @dealership = Dealership.new("Acme Auto", "123 Main Street")
    @car_1 = Car.new("Ford Mustang", 1500, 36)
    @car_2 = Car.new("Toyota Prius", 1000, 48)
    @dealership.add_car(@car_1)
    @dealership.add_car(@car_2)

    expect(@dealership.inventory).to eq([@car_1, @car_2])
    expect(@dealership.inventory.length).to eq(2)
  end

  it 'has more inventory' do
    @dealership = Dealership.new("Acme Auto", "123 Main Street")
    @car_1 = Car.new("Ford Mustang", 1500, 36)
    @car_2 = Car.new("Toyota Prius", 1000, 48)
    @car_3 = Car.new("Toyota Tercel", 500, 48)
    @car_4 = Car.new("Chevrolet Bronco", 1250, 24)
    @dealership.add_car(@car_1)
    @dealership.add_car(@car_2)
    @dealership.add_car(@car_3)
    @dealership.add_car(@car_4)

    expect(@dealership.inventory).to eq([@car_1, @car_2, @car_3, @car_4])
    expect(@dealership.has_inventory?).to eq(true)
  end

  it 'has cars by specific makes' do
    @dealership = Dealership.new("Acme Auto", "123 Main Street")
    @car_1 = Car.new("Ford Mustang", 1500, 36)
    @car_2 = Car.new("Toyota Prius", 1000, 48)
    @car_3 = Car.new("Toyota Tercel", 500, 48)
    @car_4 = Car.new("Chevrolet Bronco", 1250, 24)
    @dealership.add_car(@car_1)
    @dealership.add_car(@car_2)
    @dealership.add_car(@car_3)
    @dealership.add_car(@car_4)

    expect(@dealership.cars_by_make("Toyota")).to eq(@make)
    expect(@dealership.cars_by_make("Ford")).to eq(@make)
    expect(@dealership.total_value).to eq(156000)
    end
    #need a hash for details....
    it 'dealership has attributes' do
      @dealership = Dealership.new("Acme Auto", "123 Main Street")
      @car_1 = Car.new("Ford Mustang", 1500, 36)
      @car_2 = Car.new("Toyota Prius", 1000, 48)
      @car_3 = Car.new("Toyota Tercel", 500, 48)
      @car_4 = Car.new("Chevrolet Bronco", 1250, 24)
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      @dealership.add_car(@car_3)
      @dealership.add_car(@car_4)
      result = {
        "total_value" => 156000,
        "adress" => "123 Main Street"
      }

      expect(@dealership.details).to eq(result)
    end
  end
