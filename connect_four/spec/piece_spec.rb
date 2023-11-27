#symbol 'x' - player, 'o' - computer
#own position 'x' and 'y' -two seperate

require './lib/piece'

RSpec.describe Piece do
  describe '#initialize' do
    it 'exists' do
      @piece = Piece.new("X", 3)
      expect(@piece).to be_a(Piece)
    end
  end

  describe '#symbol' do
    it 'can return a player symbol' do
      @piece = Piece.new("X", 3)
      expect(@piece.symbol).to eq('X')
    end

    it 'can return a computer symbol' do
      @piece = Piece.new("O", 3)
       expect(@piece.symbol).to eq('O')
    end
  end

end
