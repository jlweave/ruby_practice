require './spec/spec_helper'

RSpec.describe Room do
  describe 'Iteration 1' do
    let (:room1) {room = Room.new(:bedroom, 10, '13')}
    let (:room2) {Room.new(:living_room, 15, '12')}
    
    it 'exists' do
      expect(room1).to be_a Room
    end

    it 'it has a category' do
      expect(room1.category).to eq(:bedroom)
    end

    it 'can get area' do
      expect(room1.area).to eq(130)
      expect(room2.area).to eq(180)
    end
    
    it 'can be painted' do
      expect(room1.is_painted?).to eq(false)
      room1.paint
      expect(room1.is_painted?).to eq(true)
    end
  end
end

# let (:) {}
