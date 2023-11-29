require "rails_helper"

RSpec.describe Course do
  describe "as a visitor" do
    it "i see a list of courses and the number of students
      enrolled in each course" do
        student = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")
        student2 = Student.create!(name: "Sirius Black", age: 16, house: "Gryffindor")
        student3 = Student.create!(name: "Regulus", age: 15, house: "Slytherin")
        course1 = Course.create!(name: "Defense against the Dark Arts")
        course2 = Course.create!(name: "Charms")
        student.courses << course1
        student2.courses << course2
        student3.courses << course1

        visit "/courses"

        expect(page).to have_content("#{course1.name}: 2")
        expect(page).to have_content("#{course2.name}: 1")
      
    end
  end
end