class Dealership
  attr_reader :dealership, :address, :inventory, :inventory_count

  def initialize(dealership, address)
    @dealership = dealership
    @address = address
    @inventory = []
    @inventory_count = 0
  end

  def add_car(car)
    @inventory << car
  end

  def has_inventory?
    @inventory_count += 1
    if @inventory_count > 0
      true
    else
      false
    end
  end

  def cars_by_make(make)

  end

  # def total_cost
  #   @monthly_payment * @loan_length
  # end

  def total_value
    @car.total_cost
  end

  def details
    results = {
    "total value"  => [],
    "adress" => []
    }
    #open brackets so it can be reused for other code....


  end
end
