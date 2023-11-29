class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @quantity = 0
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(name, amount)
    @inventory[name] = amount
    @quantity += amount
  end

end
