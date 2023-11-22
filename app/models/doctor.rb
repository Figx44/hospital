class Doctor < ApplicationRecord
  # has_one :education, dependent: :destroy
  has_many :educations
  has_many :appointments
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :title, presence: true
  validates :available, presence: true
  validates :speciality, presence: true
  validates :experience, presence: 2..6

  def average_degree_score
    total_score = educations.sum(:score)
    total_score / educations.count.to_f if educations.count.positive?

    has_one :education, dependent: :destroy
  end
end
