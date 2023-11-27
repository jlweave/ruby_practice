require 'rails_helper'

RSpec.describe Patient do
  it {should have_many :doctor_patients}
  it {should have_many(:doctors).through(:doctor_patients)}

  describe "order_names" do
    it "will order only the adult names alpa" do
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
      expect(Patient.order_names).to eq([@patient1.name, @patient3.name, @patient4.name, @patient5.name, @patient7.name, @patient8.name])
    end
  end
end
