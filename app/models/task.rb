class Task < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_rich_text :content

  validates :title, presence: true, length: { maximum: 255 }
  # validates :content, presence: true
  validates :completed, inclusion: { in: [true, false] }

  validates_comparison_of :due_date, greater_than_or_equal_to: -> { Date.today }

  # Ensure due_date is not in the past if completed is true
  validate :due_date_not_in_past, if: -> { completed? && due_date.present? }

  private

  def due_date_not_in_past
    errors.add(:due_date, "can't be in the past when the task is marked as completed") if due_date < Date.today
  end
end
