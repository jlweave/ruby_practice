class PatientsController < ApplicationController

  def index
    # require 'pry'; binding.pry
    @patients = Patient.all
    @adult_patients = @patients.order_names
  end
end