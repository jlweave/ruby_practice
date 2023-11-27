#name #{}, symbol, type: human, computer
class Player
  attr_reader :type,
              :symbol,
              :name

  def initialize(type, symbol, name)
    @type = type
    @symbol = symbol
    @name = name
    
  end
end