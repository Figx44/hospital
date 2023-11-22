# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
# doctors = FactoryBot.create_list(:doctor, 5)

#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"

puts "Deleting all educations"
Education.destroy_all
puts "Deleting all doctors"
Doctor.destroy_all
puts "Deleting all patients"
Patient.destroy_all

puts "Creating doctors"
5.times do
   doctor = Doctor.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    title: ["Dr", "Prof"].sample,
    available: ["True", "False"].sample,
    speciality: ["Pedriatic", "Cardiovascular", "Dermatologist", "Phisioterapist", "Massagist"].sample,
    experience: rand(2..6)
  )
  doctor.save!
end
puts 'Finished!'

puts "Creating educations"
5.times do
  education = Education.new(
    university: Faker::University.name,
    degree_name: Faker::Educator.degree,
    score: rand(50..100),
    doctor: Doctor.all.sample
  )
  education.save!
end
puts 'Finished!'


puts "Creating patients"
5.times do
  patient = Patient.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    insurance: %w(Private Public).sample,
    cured: [true, false].sample
  )
  patient.save!
end
puts 'Finished!'
