class CreateEducations < ActiveRecord::Migration[7.1]
  def change
    create_table :educations do |t|
      t.string :university
      t.string :degree_name
      t.string :score
      t.boolean :doctor_id
      t.timestamps
    end
  end
end
