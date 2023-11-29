require "rails_helper"

RSpec.describe Student do

  describe "#show" do
    it "shows a list of a students courses" do
      student = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")
      course1 = Course.create!(name: "Defense against the Dark Arts")
      student.courses << course1

        visit "/students/#{student.id}"

      expect(page).to have_content(course1.name)
    end
  end

end