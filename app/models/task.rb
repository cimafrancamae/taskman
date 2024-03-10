class Task < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_rich_text :content

  validates :title, presence: true, length: { maximum: 255 }
  # validates :completed, inclusion: { in: [true, false] }

  validates_comparison_of :due_date, greater_than_or_equal_to: -> { Date.today }
end
