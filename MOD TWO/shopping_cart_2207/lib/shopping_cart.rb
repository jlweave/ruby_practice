#Sergio_Azcona
require './lib/product'

class ShoppingCart
  attr_reader :name, :capacity, :products
  def initialize(name, capacity)
    @name = name
    @capacity = capacity.to_i
    @products = []
  end

  def add_product(item)
    products << item
  end

  def details
    # { Product.name. Product.quantity }
  end

  def total_number_of_products
    @products.count
  end
end