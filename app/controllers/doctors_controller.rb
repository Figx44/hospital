class DoctorsController < ApplicationController

  def index
    @doctors = Doctor.all
  end

  def new
   @doctor = Doctor.new
  end

   def show
     @doctor = Doctor.find(params[:id])
     @appointments = @doctor.appointments.future_appointments
   end

   def make_unavailable
    # Implement logic to make the doctor unavailable and delete appointments
  end
end


  def create
    @doctor = Doctor.new(doctors_params)
    @doctor.save
    redirect_to doctor_path(@doctor)
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    @doctor.update(doctors_params)
    redirect_to doctor_path(@doctor)
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    redirect_to doctors_path, status: :see_other

  end

  private

  def doctors_params
    params.require(:doctor).permit(:first_name, :last_name, :title, :available, :speciality, :experience)
  end
