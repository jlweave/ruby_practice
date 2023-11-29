class AdminApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    @pets = @application.pets
  end

  def update
    application_pet = ApplicationPet.find_by(pet_id: admin_application_params[:pet_id], application_id: admin_application_params[:id])
    if admin_application_params[:status] == 'Approved'
      application_pet.update(status: 'Approved')
    else
      application_pet.update(status: 'Rejected')
    end
    redirect_to "/admin/applications/#{application_pet.application.id}"
  end

  private
  def admin_application_params
    params.permit(:id, :pet_id, :status)
  end
end