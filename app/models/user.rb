class User < ApplicationRecord
  has_secure_password

  belongs_to :city
  has_many :gossips
  has_many :comments

  validates :email,
    presence: true,
    format: {with: /\A[^@\s]+@([^@\s]+.)+[^@\s]+\z/, message: "email address please"}
  validates :password, presence: true, length: {minimum:5}

end
