class Admin < ApplicationRecord
    has_secure_password
    has_many :buses
    has_many :drivers
    has_many :customers
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true, length: { minimum: 4 }
    def generate_jwt
        payload = { user_id: id, is_admin: true }
        Jsonwebtoken.encode(payload)
      end
end
