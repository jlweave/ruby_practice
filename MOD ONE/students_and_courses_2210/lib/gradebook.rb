class Gradebook
  attr_reader :instructor,
              :courses

  def initialize(instructor)
    @instructor = instructor
    @courses = []
  end

  def add_courses(course)
    @courses << course
  end

  def courses_and_students
    course_hash = {}
    @courses.each do |course|
      course_hash[course.name] = []
      course.students.each do |student|
        course_hash[course.name] << student
      end
    end
    course_hash
  end

  def low_grade
    low_grade_arr = []
    @courses.each do |course|
      course.students.each do |student|
        if student.grade < 80
          low_grade_arr << student
        end
      end
    end
    low_grade_arr
  end

  def grades_in_courses
    grades_hash = {}
    @courses.each do |course|
      grades_hash[course.name] = []
      course.students.each do |student|
        grade = student.grade
          grades_hash[course.name] << grade
      end
    end
    grades_hash
  end

  def student_with_grade_range
    grade_arr = []
    @courses.each do |course|
      course.students.each do |student|
        name = student.name
         if student.grade > 90
          grade_arr << name
        end
      end
    end
   grade_arr
  end
end