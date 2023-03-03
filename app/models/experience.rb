class Experience < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  belongs_to :user
  has_many_attached :photos

  validates :category, :title, :location, :description, presence: true

  def average_rating
    reviews.average(:rating).to_f
  end
end
