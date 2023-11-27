class Course
  attr_reader :name,
              :capacity,
              :students,
              :full

  attr_accessor :full

  def initialize(name, capacity)
    @name = name
    @capacity = 2
    @students = []
    @full = false
  end

  def full?
    if @students.length == @capacity
      true
    else 
      false
    end
  end

  def enroll(student)
    @students << student
  end
end