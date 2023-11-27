class Visitor
  attr_reader :name,
              :height,
              :spending_money,
              :preferences

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money.delete('$').to_i
    @preferences = []
  end

  def add_preference(item)
    @preferences << item
  end

  def tall_enough?(height_variable)
    if @height >= height_variable
      true
    else
      false
    end
  end

    def preference_check(rides_pref)
      count = 0
      @preferences.each do |pref|
        if rides_pref == pref
          count += 1
        end
      if count > 0
        true
      end
    end
  end

  def spend(amount)
    @spending_money -= amount
  end
end