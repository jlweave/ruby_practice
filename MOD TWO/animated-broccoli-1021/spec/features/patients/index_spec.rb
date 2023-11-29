require "rails_helper" 

RSpec.describe "Patients Index Page" do
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

  describe "User Story 3" do
    describe "when I visit the patients index page" do
      it "show all of the adult patients(older than 18) and in alphabetical order" do
        visit patients_path
        save_and_open_page

        expect(@patient1.name).to appear_before(@patient3.name)
        expect(@patient3.name).to appear_before(@patient4.name)
        expect(@patient5.name).to appear_before(@patient7.name)
        expect(@patient7.name).to appear_before(@patient8.name)
        expect(page).to_not have_content(@patient2.name)
        expect(page).to_not have_content(@patient6.name)
      end
    end
  end
end