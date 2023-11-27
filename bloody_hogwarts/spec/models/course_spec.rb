require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:students).through(:student_courses)}
  end

  describe "behavior" do
    it "#student_count" do
      student = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")
      student2 = Student.create!(name: "Sirius Black", age: 16, house: "Gryffindor")
      student3 = Student.create!(name: "Regulus", age: 15, house: "Slytherin")
      course1 = Course.create!(name: "Defense against the Dark Arts")
      course2 = Course.create!(name: "Charms")
      student.courses << course1
      student2.courses << course2
      student3.courses << course1

      expect(course1.student_count).to eq(2)
      expect(course2.student_count).to eq(1)     
    end
  end
end
