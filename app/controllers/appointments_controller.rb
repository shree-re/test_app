class AppointmentsController < ApplicationController
  
  def index
  	@doctor = Doctor.new
  	@patient = Patient.new
  	@appointment = Appointment.new
  	@appointments = Appointment.all
  end

  def create
  	@appointment = Appointment.new(appointment_params)

    @appointment.user_id = current_user.id
  	if @appointment.save
      redirect_to authenticated_root_path, notice: "Doctor was created"
    else
      redirect_to authenticated_root_path, notice: "there were few errors"
    end
  end

  private

  def appointment_params
  	params.require(:appointment).permit(:doctor_id, :patient_id, :disease)
  end

end
