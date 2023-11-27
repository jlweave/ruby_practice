require './lib/board'

RSpec.describe Board do
  describe '#initialize' do
    it 'exists' do
      board = Board.new(7, 6)

      expect(board).to be_a Board
    end

    it 'has a column index hash' do
      board = Board.new(7, 6)

      expect(board.col_indices).to be == {
        "A" => 0, 
        "B" => 1, 
        "C" => 2, 
        "D" => 3, 
        "E" => 4, 
        "F" => 5, 
        "G" => 6
      }
    end

    it 'can have a different set of colunm indices' do
      board = Board.new(5, 6)

      expect(board.col_indices).to be == {
        "A" => 0, 
        "B" => 1, 
        "C" => 2, 
        "D" => 3, 
        "E" => 4, 
      }
    end

    it 'has a columns array' do
      board = Board.new(7, 6)

      expect(board.columns).to eq [[],[],[],[],[],[],[]] 
    end

    it 'can have a columns array with a different width' do
      board = Board.new(5, 6)

      expect(board.columns).to eq [[],[],[],[],[]] 
    end

  end

  describe '#full_board?' do
    it 'checks if the board is full' do
      board = Board.new(7, 6)

      expect(board.full_board?).to be false
    end

    it 'will return true for a full board' do
      board = Board.new(7, 6)
      board.col_indices.each_key do |column|
        6.times do
          board.place_piece('X', column)
        end
      end
      
      expect(board.full_board?).to be true
    end
  end

  describe 'place_piece' do
    it 'makes a new piece and adds it to grid' do
      board = Board.new(7, 6)
      board.place_piece('X', 'A')

      expect(board.columns[0][0]).to be_a Piece
    end

    it 'assigns piece appropriate x coord' do
      board = Board.new(7, 6)
      board.place_piece('X', 'A')
      board.place_piece('O', 'D')

      expect(board.columns[3][0].x_pos).to be 3
    end

    it 'assigns piece appropriate y coord' do
      board = Board.new(7, 6)
      board.place_piece('X', 'A')
      board.place_piece('O', 'A')

      expect(board.columns[0][1].y_pos).to be 1
    end
  end

  describe '#display_board' do
    it 'returns a string' do
      board = Board.new(7, 6)

      expect(board.display_board).to be == (
      "A B C D E F G \n. . . . . . . \n. . . . . . . \n. . . . . . . \n. . . . . . . \n. . . . . . . \n. . . . . . . \n"
      )
    end

    it 'can return a different string if a piece is placed' do
      board = Board.new(7, 6)
      board.place_piece('X', 'A')

      expect(board.display_board).to eq "A B C D E F G \n. . . . . . . \n. . . . . . . \n. . . . . . . \n. . . . . . . \n. . . . . . . \nX . . . . . . \n"
    end
  end

  describe '#fetch_piece' do
    it "returns a piece" do
      board = Board.new(7, 6)
      board.place_piece('X', 'A')
      board.place_piece('O', 'A')

      piece1 = board.fetch_piece(0, 0)
      piece2 = board.fetch_piece(0, 1)
      
      #An element that does not exist
      piece3 = board.fetch_piece(4 ,3)

      #A negative index
      piece4 = board.fetch_piece(-1, 0)

      
      expect(piece1.symbol).to eq 'X'
      expect(piece2.symbol).to eq 'O'
      expect(piece3).to be_a NullPiece
      expect(piece4).to be_a NullPiece
    end
  end 
end
