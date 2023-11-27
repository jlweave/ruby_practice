require "rails_helper" 

RSpec.describe "Doctors Show Page" do
  before (:each) do
    @hospital1 = Hospital.create!(name: "Funny Smells")
    @hospital2 = Hospital.create!(name: "Arm and a Leg")

    @doctor1 = @hospital1.doctors.create!(name: "Blind Betty", specialty: "Eyes", university: "Weekend Degree")
    @doctor2 = @hospital1.doctors.create!(name: "Silly Nedd", specialty: "Brain Surgery", university: "Good Enough")
    @doctor3 = @hospital1.doctors.create!(name: "Archy Bunker", specialty: "Toe Nail Design", university: "Cs get Degrees")
    @doctor4 = @hospital2.doctors.create!(name: "Homer Simposon", specialty: "Nose Hairs", university: "Wont tell if you dont")
    @doctor5 = @hospital2.doctors.create!(name: "Old Jack", specialty: "Knee-cap Cosmetic Surgery", university: "Who cares")

    @patient1 = Patient.create!(name: "Holly Holiday", age: 45)
    @patient2 = Patient.create!(name: "Johnny Johnson", age: 15)
    @patient3 = Patient.create!(name: "Kimberly Krabby", age: 25)
    @patient4 = Patient.create!(name: "Lucy Lou", age: 32)
    @patient5 = Patient.create!(name: "Mandi Moore", age: 21)
    @patient6 = Patient.create!(name: "Nelly Nelson", age: 10)
    @patient7 = Patient.create!(name: "Patty Paterson", age: 56)
    @patient8 = Patient.create!(name: "Robert Robertson", age: 82)


    @doctorpatients1 = DoctorPatient.create!(doctor_id: @doctor1.id, patient_id: @patient1.id)
    @doctorpatients2 = DoctorPatient.create!(doctor_id: @doctor1.id, patient_id: @patient2.id)
    @doctorpatients3 = DoctorPatient.create!(doctor_id: @doctor2.id, patient_id: @patient3.id)
    @doctorpatients4 = DoctorPatient.create!(doctor_id: @doctor2.id, patient_id: @patient4.id)
    @doctorpatients5 = DoctorPatient.create!(doctor_id: @doctor2.id, patient_id: @patient5.id)
    @doctorpatients6 = DoctorPatient.create!(doctor_id: @doctor3.id, patient_id: @patient6.id)
    @doctorpatients7 = DoctorPatient.create!(doctor_id: @doctor3.id, patient_id: @patient7.id)
    @doctorpatients8 = DoctorPatient.create!(doctor_id: @doctor4.id, patient_id: @patient8.id)
    @doctorpatients9 = DoctorPatient.create!(doctor_id: @doctor5.id, patient_id: @patient1.id)
    @doctorpatients10 = DoctorPatient.create!(doctor_id: @doctor5.id, patient_id: @patient2.id)
    @doctorpatients11 = DoctorPatient.create!(doctor_id: @doctor5.id, patient_id: @patient3.id)
  end

  describe "User Story 1" do
    describe "When I visit the doctors show page" do
      it "List all of that doctors information(name, specialty, university)" do
        visit doctor_path(@doctor2.id)

        expect(page).to have_content(@doctor2.name)
        expect(page).to have_content(@doctor2.specialty)
        expect(page).to have_content(@doctor2.university)

        expect(page).to_not have_content(@doctor3.name)
        expect(page).to_not have_content(@doctor3.specialty)
        expect(page).to_not have_content(@doctor3.university)
      end

      it "shows the name of the hospital where they work and all of their patients" do
        visit doctor_path(@doctor2.id)

        expect(page).to have_content(@hospital1.name)
        expect(page).to have_content(@patient3.name)
        expect(page).to have_content(@patient4.name)
        expect(page).to have_content(@patient5.name)

        expect(page).to_not have_content(@patient6.name)
        expect(page).to_not have_content(@patient7.name)
        expect(page).to_not have_content(@patient8.name)
      end
    end

    describe "User Story 2" do
      describe "When I visit the Doctors show page" do
        it "I see a button to remove that patient from that doctors caseload" do
          visit doctor_path(@doctor1.id)
# save_and_open_page
          expect(page).to have_link("Delete #{@patient1.name}")
          expect(page).to_not have_link("Delete #{@patient4.name}")
        end

        it "When I click the button I am brought back to the doctors show page and no longer see that patients name" do
          visit doctor_path(@doctor1.id)

          click_link("Delete #{@patient1.name}")
          expect(current_path).to eq(doctor_path(@doctor1))
save_and_open_page

          expect(page).to_not have_content(@patient1.name)
          expect(page).to have_content(@patient2.name)

        end
      end
    end
  end
end