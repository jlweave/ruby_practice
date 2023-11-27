class Auction
  attr_reader :items,
              :bids


  def initialize
    @items = []
    @bids = Hash.new(0)
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  # def add_bid(item, amount)
  #   @bids[item] += amount
  # end

end
