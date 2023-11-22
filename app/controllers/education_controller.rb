class EducationController < ApplicationController
  before_action :set_doctor
  before_action :set_education, only: [:edit, :update, :destroy]

  def index
    @educations = @doctor.educations
  end

  def new
    @education = @doctor.educations.build
  end

  def create
    @education = @doctor.educations.build(education_params)
    if @education.save
      redirect_to doctor_educations_path(@doctor), notice: 'Education/Degree was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @education.update(education_params)
      redirect_to doctor_educations_path(@doctor), notice: 'Education/Degree was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @education.destroy
    redirect_to doctor_educations_path(@doctor), notice: 'Education/Degree was successfully destroyed.'
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end

  def set_education
    @education = @doctor.educations.find(params[:id])
  end

  def education_params
    # Define your education parameters
  end
end
