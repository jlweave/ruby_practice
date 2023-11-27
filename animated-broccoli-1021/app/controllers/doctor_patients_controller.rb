class DoctorPatientsController < ApplicationController
  def destroy
    # require 'pry'; binding.pry
    @doctor = Doctor.find(params[:doctor_id])
    @remove_pair = DoctorPatient.find_by(doctor_id: params[:doctor_id], patient_id: params[:id])
    @remove_pair.destroy
    redirect_to "/doctors/#{@doctor.id}"
  end
end