class NullPiece
  attr_reader :symbol, :x_pos, :y_pos
  def initialize
    #an arbitarily large number that will never exist in the grid arrays
    @x_pos = 1000
    @y_pos = 1000
    @symbol = '.'
  end
end
