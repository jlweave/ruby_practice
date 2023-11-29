require "rails_helper"

RSpec.describe Student do

  describe "#index" do
    it "shows a list of students information" do
    student = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")
      
      visit "/students"

      expect(page).to have_content("Casseopia Black")
      expect(page).to have_content(14)
      expect(page).to have_content("Slytherin")
    end
  end

  describe "average age of students" do
    it "shows the average age of all students" do
      student = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")
      student1 = Student.create!(name: "Harry", age: 19, house: "Slytherin")
      student2 = Student.create!(name: "Ron", age: 18, house: "Slytherin")

      visit "/students" 

      expect(page).to have_content("Average Age: 17")

    end
  end
end