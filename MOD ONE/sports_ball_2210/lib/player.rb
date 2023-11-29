#8:44 start
#9:47 10 min break
class Player
  attr_reader :name,
              :first_name,
              :last_name,
              :monthly_cost,
              :contract_length,
              :nickname

  def initialize(name, monthly_cost,contract_length)
    @name = name.split(' ')
    @first_name = @name[0]
    @last_name = @name[1]
    @monthly_cost = monthly_cost
    @contract_length = contract_length
    @nickname = nickname
  end

  def total_cost
    @monthly_cost * @contract_length
  end

  def set_nickname!(name)
    @nickname = name
  end
end