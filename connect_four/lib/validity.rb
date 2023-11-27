class Validity
  def initialize(board)
    @board = board
  end

  def valid_player_input?(player_input)
     @board.col_indices.keys.include?(player_input.upcase)
  end

  def valid_col?(player_input)
     @board.columns[@board.col_indices[player_input]].length < @board.board_height
  end

  def validity_checks(player_input)
    valid_player_input?(player_input) && valid_col?(player_input)
  end
end