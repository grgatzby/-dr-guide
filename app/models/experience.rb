class Experience < ApplicationRecord
  has_many :reviews
  belongs_to :user

  validates :category, :title, :location, :description, presence: true
end
