class WinCheck
  attr_reader :board

  def initialize(board, win_condition)
    @win_condition = win_condition
    @board = board
  end

    #The nested ranges below generate every coordinate associated with a cardinal and ordinal direciton. 
    #for example (-1, -1) refers to one column to the left, and down one position, i.e. 'South-West', 'Diagonally down and to the left' etc.
    #The function then recusively calls "check" in that direction until it encounters
    #a position with a symbol that does not match the original piece.

  def win?(piece)
    check_all(piece).any? do |count| 
      count >= @win_condition
    end
  end
  
  private

  def check_all(piece)
    counts = []
    #x_coord modifier
    (-1..1).each do |x_mod|
      #y_coord modifier
      (-1..1).each do |y_mod|
        
        check_count = 0
        #This line skips (0,0) which would check the piece against itself, infinitely.
        next if x_mod == 0 && y_mod == 0
        
        piece_to_test = @board.fetch_piece((piece.x_pos + x_mod), (piece.y_pos + y_mod))
        
        count = check(piece, piece_to_test, x_mod, y_mod, check_count)
        #Reverse check. For any direction, we need to also check in the opposite direction and add it to our total checks,
        #in case our piece is in the middle of a line of connected pieces. 
        #this is accomplish by inverting the sign of our coordinate modifiers.
        x_mod, y_mod = -x_mod, -y_mod
        piece_to_test = @board.fetch_piece((piece.x_pos + x_mod), (piece.y_pos + y_mod))
        reverse_count = check(piece, piece_to_test, x_mod, y_mod, check_count )
        total = count + reverse_count
        counts << total
      end
    end
    counts
  end


  def check(piece, piece_to_test, x_mod, y_mod, check_count) 
        
    if piece.symbol == piece_to_test.symbol #escape condtion.
      check_count += 1
      next_piece = @board.fetch_piece((piece_to_test.x_pos + x_mod),(piece_to_test.y_pos + y_mod))
      
      check_count = check(piece_to_test, next_piece, x_mod, y_mod, check_count)
    end
    check_count      
  end    
end
