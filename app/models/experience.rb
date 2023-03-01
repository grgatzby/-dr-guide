class Experience < ApplicationRecord
  has_many :reviews
  belongs_to :user
  has_one_attached :photo

  validates :category, :title, :location, :description, presence: true
end
