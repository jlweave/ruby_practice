require './spec/spec_helper'

RSpec.describe House do
  describe 'Iteration 2' do
    let (:house1) {House.new("$400000", "123 sugar lane")}
    let (:room1) {Room.new(:bedroom, 10, '13')}
    let (:room2) {Room.new(:bedroom, 11, '15')}

    it 'exists and has readable attributes' do
      expect(house1).to be_a(House)
      # binding.pry
      expect(house1.price).to eq(400000)
      expect(house1.address).to eq("123 sugar lane")
      expect(house1.rooms).to eq([])
    end
    
    it 'can add rooms to the house' do
      house1.add_room(room1)
      house1.add_room(room2)
      expect(house1.rooms).to eq([room1, room2])
    end
  end
  
  describe 'Iteration 3' do
    let (:house1) {House.new("$400000", "123 sugar lane")}
    let (:room1) {Room.new(:bedroom, 10, '13')}
    let (:room2) {Room.new(:bedroom, 11, '15')}
    let (:room3) {Room.new(:living_room, 25, '15')}
    let (:room4) {Room.new(:basement, 30, '41')}
    
    it 'can recognize if a house is above market avg price' do
      expect(house1.above_market_average?).to eq(false)
    end
    
    it 'can list rooms within a certain category' do
      house1.add_room(room1)
      house1.add_room(room2)
      house1.add_room(room3)
      house1.add_room(room4)
      
      expect(house1.rooms_from_category(:bedroom))
      expect(house1.rooms_from_category(:basement))
    end
    
    it 'can calculate its total area' do
      house1.add_room(room1)
      house1.add_room(room2)
      house1.add_room(room3)
      house1.add_room(room4)
      
      expect(house1.area).to eq(1900)
    end
    
    it 'can return the details of the house as a hash' do
      house1.add_room(room1)
      house1.add_room(room2)
      house1.add_room(room3)
      house1.add_room(room4)
      
      expect(house1.details).to eq({"price" => 400000, "address" => "123 sugar lane"})
    end
  end
end

# expect().to eq()
# let (:) {}