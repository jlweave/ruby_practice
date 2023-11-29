class Student
  attr_reader :name,
              :age,
              :scores

  def initialize(info)
    @name = info[:name]
    @age = info[:age]
    @scores = []
  end

  def log_score(number)
    @scores << number
  end

  def grade
   @scores.sum / @scores.length.to_f
  end
end