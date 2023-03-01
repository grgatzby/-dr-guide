class Review < ApplicationRecord
  belongs_to :user
  belongs_to :experience

  validates :comment, presence: true, length: { maximum: 250 }
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
