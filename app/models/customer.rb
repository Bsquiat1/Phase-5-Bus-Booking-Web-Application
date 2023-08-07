# app/models/customer.rb

class Customer < ApplicationRecord
  has_secure_password
  has_many :bookings, dependent: :destroy
  has_many :buses, through: :bookings

  belongs_to :admin
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true, length: { minimum: 4 }
  def generate_jwt
    payload = { user_id: id }
    jwt.encode(payload)
  end
end
