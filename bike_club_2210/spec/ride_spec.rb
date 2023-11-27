require './lib/ride'

RSpec.describe Ride do
  let!(:ride1) {Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})}  
  let!(:ride2) {Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})}

  it 'exists and has attributes' do
    expect(ride1).to be_a(Ride)
    expect(ride1.name).to eq('Walnut Creek Trail')
    expect(ride1.distance).to eq(10.7)
    expect(ride1.terrain).to eq(:hills)
    expect(ride1.loop?).to be(false)
  end
  
  it 'can test if it is a loop' do
    expect(ride1.loop?).to be(false)
    expect(ride2.loop?).to be(true)
  end

  it 'can calculate a distance' do
    expect(ride1.total_distance).to eq(21.4)
    expect(ride2.total_distance).to eq(14.9)
  end
end