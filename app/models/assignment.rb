class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :project

  # Validations
  validates_presence_of :start_date, :due_date, :status
  validate :start_date_cannot_be_in_the_past
  validate :due_date_must_be_after_reservation_date

  private

  def start_date_cannot_be_in_the_past
    return unless start_date.present? && start_date < Date.today

    errors.add(:start_date, "can't be in the past")
  end

  def due_date_must_be_after_start_date
    return unless start_date.present? && due_date.present? && due_date <= start_date

    errors.add(:due_date, 'must be after the start date')
  end
end
