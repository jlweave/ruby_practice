class Item
  attr_reader :name,
              :bids

  def initialize(name)
    @name = name
    @bids = Hash.new(0)
  end

  def add_bid(name, amount)
    # require "pry"; binding.pry
    @bids[name] += amount
  end

  def unpopular_items
  end

  def potential_revenue
    @bids.sum do |item, quantity|
      item.price * quantity
    end
  end
end
