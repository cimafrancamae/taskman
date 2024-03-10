class Category < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :name, presence: true,
    length: { maximum: 255 },
    uniqueness: { scope: :user, case_sensitive: false, message: "Category already exists" }
end
