class Education < ApplicationRecord

  validates :university, presence: true
  validates :degree_name, presence: true
  validates :score, numericality: { greater_than: 50, less_than: 100 }

  belongs_to :doctor
end
