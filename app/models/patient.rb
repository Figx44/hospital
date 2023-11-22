class Patient < ApplicationRecord

  has_many :appointments
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :insurance, inclusion: { in: %w(Private Public) }
  validates :cured, inclusion: { in: [true, false] }

end
