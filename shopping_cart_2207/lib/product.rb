#Sergio_Azcona
class Product 
  attr_reader :category, :name, :unit_price, :quantity, :hoard
  def initialize(category, name, unit_price, quantity)
    @category = category
    @name = name
    @unit_price = unit_price
    @quantity = quantity.to_i
    @hoard = false  
  end

  def total_price
    @unit_price * @quantity
  end

  def is_hoarded?
     if !@hoard
      return true
     else
      return false
     end
  end

  # def hoard
  #   @is_hoarded == false
  # end
end