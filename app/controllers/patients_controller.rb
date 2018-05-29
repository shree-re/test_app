class PatientsController < ApplicationController
  def create
  	@patient = Patient.new(patient_params)
  	@patient.user_id = current_user.id
  	
  	if @patient.save
      redirect_to authenticated_root_path, notice: "Patient was created"
    else
      redirect_to authenticated_root_path, notice: "there were few errors"
    end
  end

  private

  def patient_params
  	params.require(:patient).permit(:name, :phone)
  end
end
