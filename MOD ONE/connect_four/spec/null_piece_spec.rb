require './lib/null_piece'

RSpec.describe NullPiece do
  describe '#initialize' do
    it 'exists' do
      null = NullPiece.new

      expect(null).to be_a NullPiece
    end

    it "has default symbol '.'" do
      expect(NullPiece.new.symbol).to eq '.'
    end

    it 'has an x_pos' do
      null = NullPiece.new

      expect(null.x_pos).to eq 1000
    end

    it 'has a y_pos' do
      null = NullPiece.new

      expect(null.y_pos).to eq 1000
    end
  end
end
