class Item
  attr_reader :name,
              :price

  def initialize(information)
    @name = information[:name]
    @price = information[:price]
  end



end
