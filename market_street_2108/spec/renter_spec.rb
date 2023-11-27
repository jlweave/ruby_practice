require './lib/renter'

RSpec.describe 'Iteration 1' do
  before :each do
    @jessie = Renter.new("Jessie")
  end
  
  it '1. Renter Instantiation' do
    expect(@jessie).to be_an_instance_of(Renter)
  end

  it '2. Renter #name' do
    expect(@jessie.name).to eq("Jessie")
  end
end
