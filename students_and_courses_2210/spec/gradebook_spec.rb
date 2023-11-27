require './lib/course'
require './lib/student'
require './lib/gradebook'

RSpec.describe Gradebook do
  before (:each) do
    @gradebook = Gradebook.new("Bill Nye")
    @science = Course.new("Science", 2)
    @biology = Course.new("Biology", 2)
    @anatomy = Course.new("Anatomy", 2)
    @morgan = Student.new({name: "Morgan", age: 21})
    @lucy = Student.new({name: "lucy", age: 25})
    @lynol = Student.new({name: "Lynol", age: 23})
    @snoopy = Student.new({name: "Snoopy", age: 20})
    @patti = Student.new({name: "Patti", age: 24})
  end

  describe '#initialize' do
    it 'exists and has readbable attributes' do
      expect(@gradebook).to be_a(Gradebook)
      expect(@gradebook.instructor).to eq("Bill Nye")
      expect(@gradebook.courses).to eq([])
    end
  end

  describe '#add_courses' do
    it 'can add a course to the courses array' do 
      @gradebook.add_courses(@biology)
      @gradebook.add_courses(@science)
      @gradebook.add_courses(@anatomy)

      expect(@gradebook.courses).to eq([@biology, @science, @anatomy])
    end
  end

  describe '#courses_and_students' do
    it 'can add students to the courses' do
      @gradebook.add_courses(@biology)
      @gradebook.add_courses(@science)
      @gradebook.add_courses(@anatomy)
      @science.enroll(@morgan)
      @biology.enroll(@snoopy)
      @biology.enroll(@lynol)
      @anatomy.enroll(@patti)
      @anatomy.enroll(@lucy)

      expect(@gradebook.courses_and_students).to eq({
        "Science" => [@morgan],
        "Biology" => [@snoopy, @lynol],
        "Anatomy" => [@patti, @lucy]
      })
    end
  end

  describe '#low_grade' do
    it 'can list all students with a grade below a given threshold' do
      @gradebook.add_courses(@biology)
      @biology.enroll(@snoopy)
      @biology.enroll(@patti)
      @biology.enroll(@lucy)
      @snoopy.log_score(89)
      @snoopy.log_score(93)
      @patti.log_score(78)
      @patti.log_score(85)
      @lucy.log_score(63)
      @lucy.log_score(74)
     
      expect(@snoopy.grade).to eq(91.0)
      expect(@patti.grade).to eq(81.5)
      expect(@lucy.grade).to eq(68.5)
      expect(@gradebook.low_grade).to eq([@lucy])
    end
  end

  #IT 4
  describe '#grades_in_courses' do
    it 'can track all the grades across all courses' do
      @gradebook.add_courses(@biology)
      @gradebook.add_courses(@science)
      @science.enroll(@lynol)
      @science.enroll(@morgan)
      @biology.enroll(@snoopy)
      @biology.enroll(@patti)
      @biology.enroll(@lucy)
      @lynol.log_score(96)
      @lynol.log_score(94)
      @morgan.log_score(85)
      @morgan.log_score(79)
      @snoopy.log_score(89)
      @snoopy.log_score(93)
      @patti.log_score(78)
      @patti.log_score(85)
      @lucy.log_score(63)
      @lucy.log_score(74)

      expect(@lynol.grade).to eq(95.0)
      expect(@morgan.grade).to eq(82.0)
      expect(@snoopy.grade).to eq(91.0)
      expect(@patti.grade).to eq(81.5)
      expect(@lucy.grade).to eq(68.5)
      expect(@gradebook.grades_in_courses).to eq({
        "Science" => [95.0, 82.0],
        "Biology" => [91.0, 81.5, 68.5]
      })
    end
  end

  describe 'student_with_grade_range' do
    it 'find all students across all courses that have a grade in a given range.' do
      @gradebook.add_courses(@biology)
      @gradebook.add_courses(@science)
      @science.enroll(@lynol)
      @science.enroll(@morgan)
      @biology.enroll(@snoopy)
      @biology.enroll(@patti)
      @biology.enroll(@lucy)
      @lynol.log_score(96)
      @lynol.log_score(94)
      @morgan.log_score(85)
      @morgan.log_score(79)
      @snoopy.log_score(89)
      @snoopy.log_score(93)
      @patti.log_score(78)
      @patti.log_score(85)
      @lucy.log_score(63)
      @lucy.log_score(74)

      expect(@gradebook.student_with_grade_range).to eq(["Snoopy", "Lynol"])
    end
  end
end