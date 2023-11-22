class AddDoctorReferenceToPatients < ActiveRecord::Migration[7.1]
  def change
    remove_column :educations, :doctor_id, :boolean
    add_reference :educations, :doctor, foreign_key: true
  end
end
