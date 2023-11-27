require './lib/ride'
require './lib/biker'

RSpec.describe Biker do
  let!(:biker) {Biker.new("Kenny", 30)}
  let!(:biker2) {Biker.new("Athena", 15)}
  let!(:ride1) {Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})}
  let!(:ride2) {Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})}
  let!(:ride3) {Ride.new({name: "Coconut Lake", distance: 32, loop: true, terrain: :gravel})}


  it 'exists and has attributes' do
    expect(biker).to be_a(Biker)
    expect(biker.name).to eq('Kenny')
    expect(biker.max_distance).to eq(30)
    expect(biker.rides).to eq({})
    expect(biker.acceptable_terrain).to eq([])
  end

  it 'can learn terrain' do
    biker.learn_terrain!(:gravel)
    biker.learn_terrain!(:hills)
    
    expect(biker.acceptable_terrain).to eq([:gravel, :hills])
  end
  
  it 'can log rides' do
    biker.learn_terrain!(:gravel)
    biker.learn_terrain!(:hills)

    biker.log_ride(ride1, 92.5)
    biker.log_ride(ride1, 91.1)
    biker.log_ride(ride2, 60.9)
    biker.log_ride(ride2, 61.6)

    expect(biker.rides).to eq({
      ride1 => [92.5, 91.1],
      ride2 => [60.9, 61.6]
    })
  end

  it 'will ride based on terrain and distance requirements' do
    biker.learn_terrain!(:gravel)
    biker.log_ride(ride1, 92.5)
    biker.log_ride(ride2, 60.9)
    biker.log_ride(ride3, 80.0)

    expect(biker.rides).to eq({
      ride2 => [60.9]
    })
  end

  it 'can have a personal record' do
    biker.learn_terrain!(:gravel)
    biker.learn_terrain!(:hills)

    biker.log_ride(ride1, 92.5)
    biker.log_ride(ride1, 91.1)
    biker.log_ride(ride2, 60.9)
    biker.log_ride(ride2, 61.6)

    expect(biker.personal_record(ride1)).to eq(91.1)
    expect(biker.personal_record(ride2)).to eq(60.9)
  end

  it 'will return personal record as false if the biker has not completed the ride' do
    biker2.log_ride(ride1, 97.0)
    biker2.log_ride(ride2, 67.0) 

    expect(biker2.rides).to eq({})
    expect(biker2.personal_record(ride1)).to eq(false)
    expect(biker2.personal_record(ride2)).to eq(false)
  end

  it 'can update personal record if ride is completed and requirements are met' do
    biker2.learn_terrain!(:gravel)
    biker2.learn_terrain!(:hills)

    biker2.log_ride(ride1, 95.0)
    biker2.log_ride(ride2, 65.0)

    expect(biker2.rides).to eq({
      ride2 => [65.0]
    })
    expect(biker2.personal_record(ride2)).to eq(65.0)
    expect(biker2.personal_record(ride1)).to eq(false)
  end

  it 'can calculate the total times a biker has logged a ride' do 
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

    expect(biker.total_logged_rides).to eq(4)
    expect(biker2.total_logged_rides).to eq(1)
  end

  it 'can determine which biker is eligible for a given ride' do
    biker.learn_terrain!(:gravel)
    biker.learn_terrain!(:hills)

    biker.log_ride(ride1, 92.5)
    biker.log_ride(ride1, 91.1)
    biker.log_ride(ride2, 60.9)
    biker.log_ride(ride2, 61.6)

    biker2.log_ride(ride1, 97.0)

    expect(biker.eligible?(ride1)).to be(true)
    expect(biker.eligible?(ride2)).to be(true)
    expect(biker2.eligible?(ride1)).to be(false)
  end
end
