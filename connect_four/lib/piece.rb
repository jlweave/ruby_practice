class Piece
  attr_reader :symbol,
              :x_pos
              
  attr_accessor :y_pos
  def initialize(symbol, x_pos)
    @symbol = symbol
    @x_pos = x_pos
    @y_pos 
  end
end