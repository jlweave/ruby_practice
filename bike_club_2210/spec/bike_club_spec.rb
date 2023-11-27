require './lib/ride'
require './lib/biker'
require './lib/bike_club'

RSpec.describe BikeClub do
  let!(:bike_club) {BikeClub.new('Bikes and Brews')}
  let!(:biker) {Biker.new("Kenny", 30)}
  let!(:biker2) {Biker.new("Athena", 15)}
  let!(:ride1) {Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})}
  let!(:ride2) {Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})}
  let!(:ride3) {Ride.new({name: "Coconut Lake", distance: 32, loop: true, terrain: :gravel})}

  it 'exists and has attributes' do
    expect(bike_club).to be_a(BikeClub)
    expect(bike_club.name).to eq('Bikes and Brews')
    expect(bike_club.bikers).to eq([])
  end
  
  it 'can add bikers' do
    bike_club.add_bikers(biker)
    bike_club.add_bikers(biker2)

    expect(bike_club.bikers).to eq([biker, biker2])
  end

  it 'can determine which biker has logged the most rides' do
    bike_club.add_bikers(biker)
    bike_club.add_bikers(biker2)

    biker.learn_terrain!(:gravel)
    biker.learn_terrain!(:hills)

    biker.log_ride(ride1, 92.5)
    biker.log_ride(ride1, 91.1)
    biker.log_ride(ride2, 60.9)
    biker.log_ride(ride2, 61.6)
  
    biker2.learn_terrain!(:gravel)
    biker2.learn_terrain!(:hills)
    
    biker2.log_ride(ride1, 95.0)
    biker2.log_ride(ride2, 65.0)

    expect(bike_club.most_rides).to eq(biker)
  end

  it 'can determine which biker has the fastest time for a specific ride' do
    bike_club.add_bikers(biker)
    bike_club.add_bikers(biker2)

    biker.learn_terrain!(:gravel)
    biker.learn_terrain!(:hills)

    biker.log_ride(ride2, 60.9)
    biker.log_ride(ride2, 61.6)
  
    biker2.learn_terrain!(:gravel)
    biker2.learn_terrain!(:hills)
    
    biker2.log_ride(ride2, 65.0)

    expect(bike_club.fastest_biker).to eq(biker)
  end

  it 'can determine if a biker is eligible for a specific ride' do
    bike_club.add_bikers(biker)
    bike_club.add_bikers(biker2)

    biker.learn_terrain!(:gravel)
    biker.learn_terrain!(:hills)

    biker.log_ride(ride2, 60.9)
    biker.log_ride(ride2, 61.6)

    biker2.log_ride(ride2, 65.0)

    expect(bike_club.is_eligible?(biker)).to be(true)
    expect(bike_club.is_eligible?(biker2)).to be(false)
  end
end