class House
  attr_reader :price,
              :address,
              :rooms
  def initialize(price, address)
    @price = price.gsub(/\D/,'').to_i
    @address = address
    @rooms = []
  end
  
  def add_room(room)
    @rooms << room
  end
  
  def above_market_average?
    if @price > 500000
    else
      false
    end
  end
    
  def rooms_from_category(category)
    @rooms.find_all do |room|
      room.category
    end
  end
  
  def area
    @rooms.map do |room|
      room.area
    end.sum
  end
  
  def details
    {
      "price" => @price,
      "address" => @address
    }
  end
    
end