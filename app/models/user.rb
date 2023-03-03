class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews
  has_many :experiences
  has_many :bookings, dependent: :destroy

  validates :first_name, :last_name, presence: true, length: { minimum: 2, maximum: 50 }
  # validates_format_of :password, with: /(?=.[!@#$%&].[!@#$%&])/
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end
