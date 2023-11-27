class Food
  attr_reader :upc, :description, :brand, :ingredients
  def initialize(attr)
    @upc = attr[:gtinUpc]
    @description = attr[:description]
    @brand = attr[:brandOwner]
    @ingredients = attr[:ingredients]
  end
end