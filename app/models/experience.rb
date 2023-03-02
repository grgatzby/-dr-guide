class Experience < ApplicationRecord
  has_many :reviews
  belongs_to :user
  has_many_attached :photos

  validates :category, :title, :location, :description, presence: true
end
