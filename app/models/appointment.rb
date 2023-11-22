class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  validates :date, presence: true
  validate :date_cannot_be_in_the_past
  validates :cause, presence: true
  validates :urgent, inclusion: { in: [true, false] }

  private

  def date_cannot_be_in_the_past
    errors.add(:date, "can't be in the past") if date.present? && date < DateTime.now
  end
end
