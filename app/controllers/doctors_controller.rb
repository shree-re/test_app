class DoctorsController < ApplicationController
  def create
  	@doctor = Doctor.new(doctor_params)
  	@doctor.user_id = current_user.id
  	
  	if @doctor.save
      redirect_to authenticated_root_path, notice: "Doctor was created"
    else
      redirect_to authenticated_root_path, notice: "there were few errors"
    end
  end

  private

  def doctor_params
  	params.require(:doctor).permit(:name, :phone, :specialization)
  end
end
