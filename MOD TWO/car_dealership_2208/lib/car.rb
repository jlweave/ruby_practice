class Car
  attr_reader :car, :monthly_payment, :loan_length, :make, :model
    def initialize (car, monthly_payment, loan_length)
    @car = car
    @make = "Ford"
    @model = "Mustang"
    @monthly_payment = monthly_payment
    @loan_length = loan_length
  end

  def total_cost
    @monthly_payment * @loan_length
  end

end
