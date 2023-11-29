class FoodFacade
  def self.food_search(term)
    data = FoodService.search(term)

    data[:foods].map do |food_attr|
      Food.new(food_attr)
    end
  end
end