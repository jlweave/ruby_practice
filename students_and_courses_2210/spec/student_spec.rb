require './lib/student'

RSpec.describe Student do
  before (:each) do
    @student = Student.new({name: "Morgan", age: 21})
  end

  describe '#initialize' do
    it 'exists and has readable attributes' do
    expect(@student).to be_a(Student)
    expect(@student.name).to eq('Morgan')
    expect(@student.age).to eq(21)
    expect(@student.scores).to eq([])
    end
  end

  describe '#log_score' do
    it ' can log scores into the scores array' do
      @student.log_score(89)
      @student.log_score(78)

      expect(@student.scores).to eq([89, 78])
    end
  end

  describe '#grade' do
    it 'can return the aveerage grade' do
      @student.log_score(89)
      @student.log_score(78)
      expect(@student.grade).to eq(83.5)
    end
  end
end